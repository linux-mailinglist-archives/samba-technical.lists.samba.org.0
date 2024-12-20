Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CBD9F90BB
	for <lists+samba-technical@lfdr.de>; Fri, 20 Dec 2024 11:51:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Hx+x78J3CDjf0WvmvepdKflFFAQd4THGMbiQ+d9i768=; b=DjrjQzvRGGEvS1lND2mbQq8/Ga
	UDssI+9y/j4h0ZJzA508XgOFQImuczd2/7OgbO1A+hyCgTtCcG00hCGXVNt3Edq0aVBtIV8Vl2rzj
	CKRQBlAncl+bx55JIyX1jci5nUZ0xwimmMBR/034UDI2Y6a4SZ+8bhhcqPYMl9bje0/9fhZXppph/
	SDKGzefiPK9GaOMZRxPWDfeC0+cKxEs7b9AuG1nP5uk/P7m5w3syUmvDZKlfqoabsrp0UcCXVVM0n
	ycM6bivP+hoRj/8Lc9e0dk4DgK+6vASBB+it4m5yz4+RSs/MpBq9987abxokep5yJIPJNwHDyODae
	eSkVz1lQ==;
Received: from ip6-localhost ([::1]:45928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tOabH-004die-2h; Fri, 20 Dec 2024 10:51:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28522) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOabC-004diW-3A
 for samba-technical@lists.samba.org; Fri, 20 Dec 2024 10:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=Hx+x78J3CDjf0WvmvepdKflFFAQd4THGMbiQ+d9i768=; b=FqRTaB08LQViVx9XPRMrrnOZmb
 BV2uCDIUJ/4LTwTgjcxLjtvIo1080fyMt+KVaadcWwORceCZ5MrQHwwp/dz/lsBYPIhl7kfnTArAC
 XzGKo978GNpa1Vr2adn9qPfLQ86hRP0JM/HEsYTVqiEhzgp3l2Eva/l+mrRxE+2/HgCaoT4QcBv7m
 ttezdElXY56Hy08lKUECRtwPzQdAEnGciC9UDhNa2Wee9y8a3c3dt+NTtR5IVOvItJdC2Bfq8vEfh
 BtPaYQP/zh/HwywcI/J/JYVFYz+6DNz3TxNr+D3zetuRmLGdAQl3gLpIgT+7PKuyTIiCXfXDEOiiB
 iPz4K1hd/vYIt59PHaEByYe8l+HG+cjdQQvACaYGKBx9xruIFNzR633TQOq65Ua1BOVCT0DzKH/X7
 Ls6ZPUEgJkE94Uv+DAo03Rf0CuRKRY4X2sHRhR7O76Mn+Z7q1wuo22cPqVkQCi13OE8yzICvrozVU
 lLA+YjTYzhyvpSYGTjJWYy27;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOabB-003SmP-1R; Fri, 20 Dec 2024 10:51:13 +0000
To: samba-technical@lists.samba.org, jra@samba.org
Subject: opendir()/readdir() bug in smbd
Date: Fri, 20 Dec 2024 11:51:12 +0100
Message-ID: <9807376.eNJFYEL58v@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

we have a bug in Samba which I discovered by running tests on btrfs.

The POSIX specification for readdir/opendir is the following:

  If a file is removed from or added to the directory after the most recent
  call to opendir() or rewinddir(), whether a subsequent call to readdir()
  returns an entry for that file is **unspecified**.

See https://pubs.opengroup.org/onlinepubs/9799919799/functions/readdir.html

ext4:

$ ./repro
opendir(foo)
creat(foo/bar)
readdir() loop
  readdir entry: .
  readdir entry: ..
  readdir entry: bar
readdir() detected the newly created file foo/bar


btrfs:

$ ./repro           
opendir(foo)
creat(foo/bar)
readdir() loop
  readdir entry: .
  readdir entry: ..
readdir() did NOT detect the newly created file foo/bar


I've discussed this with our Kernel people and it is a bug in Samba, we have 
to call rewinddir().


btrfs:

$ ./repro rewind
opendir(foo)
creat(foo/bar)
rewinddir(foo)
readdir() loop
  readdir entry: .
  readdir entry: ..
  readdir entry: bar
readdir() detected the newly created file foo/bar


I'm not a file server expert, so I would appreciate if someone could look into 
that.

Either we call rewinddir() after a file has been created or deleted, or we 
call it before a directory traversal is started. rewinddir() is actually doing 
an lseek().

The following commits should be reverted once we have a fix:

fe96aa111cdcc0f753075cccb8f1fd44791abaab
38b8a4f2232ca3e8dc4596c080df770f07fa49a8



Best regards


	Andreas

P.S. tmpfs also behaves like btrfs


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



