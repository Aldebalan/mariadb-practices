package bookshop.dao.test;

import bookshop.dao.AuthorDao;
import bookshop.vo.AuthorVo;

public class AuthorDaoTest {

	public static void main(String[] args) {
		AuthorVo vo = new AuthorVo();
		vo.setName("스테파니메이어");
		testInsert(vo);
	}

	public static void testInsert(AuthorVo vo) {
		boolean result = new AuthorDao().insert(vo);
		if(result) {
			System.out.println("Success!!");
		} else {
			System.out.println("Fail!!");
		}
		
	}
	
}
