package main;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import dao.BookDao;
import dao.CartDao;
import dao.CategoryDao;
import dao.MemberDao;
import dao.OrderDao;
import vo.BookVo;
import vo.CartVo;
import vo.CategoryVo;
import vo.MemberVo;
import vo.OrderVo;

public class BookMall {

	public static void main(String[] args) {
		categoryInput();
		bookInput();
		memberInput();
		cartInput();
		OrderInsert();
	}

	private static void OrderInsert() {
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		// 포맷 적용
		String formatedNow = now.format(formatter);		
		
		
		OrderVo vo = new OrderVo();
		vo.setNo(formatedNow + "-" +"0001");
		vo.setPrice("17600");
		vo.setShip("집");
		vo.setMember_no(2);
		OrderDao.insert(vo);
		
		OrderVo Ovo = new OrderVo();
		Ovo.setBook_no(2);
		Ovo.setNo(formatedNow + "-" +"0001");
		Ovo.setAmount("1");
		OrderDao.insertOrderBook(Ovo);
		
		List<OrderVo> list = new OrderDao().findAll();
		for(OrderVo orderVo : list) {
			System.out.println(orderVo.getNo() + ", " + orderVo.getBook_title() + ", " + orderVo.getAmount() + ", " + orderVo.getPrice());
		}
		
	}

	private static void cartInput() {
		CartVo vo = new CartVo();
		
		vo.setBook_no(4);
		vo.setMember_no(2);
		vo.setAmount(3);
		CartDao.insert(vo);
		
		// Cart 내용 출력
		List<CartVo> list = new CartDao().findAll();
		for(CartVo cvo : list) {
			System.out.println(cvo.getMember_name() + ", " + cvo.getBook_title() + ", " + cvo.getAmount());
		}	
		System.out.println("==================================");
	}

	private static void memberInput() {
		MemberVo vo = new MemberVo();
		vo.setName("이지은");
		vo.setTel("01077778888");
		vo.setEmail("Gohome@gmail.com");
		vo.setPassword("1357");
		MemberDao.insert(vo);
		
		
		// member 목룍 보여주기
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo mvo : list) {
			System.out.println(mvo.getName() + ", " + mvo.getEmail());
		}
		System.out.println("==================================");
	}

	private static void bookInput() {
		BookVo vo = new BookVo();
		vo.setTitle("빙빙 돌아가는 회전목마");
		vo.setPrice("18000");
		vo.setCategory_no(1);
		BookDao.insert(vo);
		
		// 책 목록 보여주기
		List<BookVo> list = new BookDao().findAll();
		for(BookVo bvo : list) {
			System.out.println(bvo.getNo() + ". " + bvo.getTitle() + 
					", "+ bvo.getPrice() + ", " + bvo.getCategory_name());
		}
		System.out.println("==================================");
	}

	private static void categoryInput() {
		CategoryVo vo = new CategoryVo();
		
		vo.setName("스포츠/Sport");
		CategoryDao.insert(vo);		
		
		// 카테고리 목록 보여주기
		List<CategoryVo> list = new CategoryDao().findAll();		
		for(CategoryVo cVo : list) {
			System.out.println(cVo .getNo() + ". " + cVo .getName());
		}
		System.out.println("==================================");			
	}

}