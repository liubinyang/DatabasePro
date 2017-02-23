CREATE DEFINER=`root`@`172.18.59.239` TRIGGER `library`.`borrow_AFTER_DELETE` AFTER DELETE ON `borrow` FOR EACH ROW
BEGIN
	update book
    set bnum=1
    where borrow.bno=book.bno;
END



CREATE DEFINER=`root`@`172.18.59.239` TRIGGER `library`.`borrow_AFTER_INSERT` AFTER INSERT ON `borrow` FOR EACH ROW
BEGIN
	update book
    set bnum=0
    where borrow.bno=book.bno;
END