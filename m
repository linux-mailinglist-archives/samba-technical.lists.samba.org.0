Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B616876EF23
	for <lists+samba-technical@lfdr.de>; Thu,  3 Aug 2023 18:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=JZS9K1+4Cccj7YyO8GDzS3h9Qf5x87cmslT9gQtNcfw=; b=WfbBfbPcUhlBe42AkYOx6lO41T
	Jvjn25DcsjSXPZRFZpmtlqdjpofsMsmCXahDcsjwwk2JLNGluMZco9c6xcjVSGg46Ea/LWr/QBpxx
	yjhE2oppQBhqe63fS7Czjra3/BKniue22sgPk/IO6KQ8xgUJGybqi6D4SGUooEZszGVONN2ebu+7V
	T50LWqCbkbicQO69tKjeODW4hcJcgJ6fkV1psi/jZ1EH80DKanS+gEBgAzeulEui1jHKFaYtHsMNI
	dmn9mczr+8NeRTSFke1JJw2NTUyaMbW6OHSFDg4XvY1YvwMglPn9bOs5nfrah5GJqwc1CJXatBuBF
	4MX57cig==;
Received: from ip6-localhost ([::1]:50114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRatl-009IOK-5I; Thu, 03 Aug 2023 16:10:01 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:53575) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRatf-009IOA-2z
 for samba-technical@lists.samba.org; Thu, 03 Aug 2023 16:09:57 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2830317C9F
 for <samba-technical@lists.samba.org>; Thu,  3 Aug 2023 19:10:10 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B9AB91B4A4
 for <samba-technical@lists.samba.org>; Thu,  3 Aug 2023 19:09:51 +0300 (MSK)
Message-ID: <051f35f4-c5cc-9932-6325-99f112b38f0f@tls.msk.ru>
Date: Thu, 3 Aug 2023 19:09:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: symbol versions in public libs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

This is a JFYI email, to show how we have to fix samba build
procedure to produce manageable packages for debian.

During 4.17 stable series, there were a few new symbols appeared
in libldb, versioned LDB_2.7.1 and LDB_2.7.2.  For example,

  ldb_msg_remove_inaccessible@LDB_2.7.2

However, new major version (samba 4.19, ldb 2.8.0) have these
symbols at version 2.8.0, not 2.7.2.  The result is that all
binaries linked with ldb-2.7.2 using these symbols does not
work with ldb-2.8.0, even if all actual code is exactly the
same.

This is because symbols "backported" from the next major release
to previous stable series are marked as belonging to this next
major release, not to the previous stable where they backported
to, even if no next major release has been released yet.

For a downstream distribution this is unacceptable. There are
two ways to deal with this situation:

  1) migrate all reverse-dependencies (users of this library)
     to the new ABI, bumping the soname.  This will divirge from
     upstream naming, since upstream uses libldb2, while we'll
     have to use libldb3, libldb4 etc - bumping soname each time
     such symbol version bump happens.

  2) provide symbols at older versions for new upstream major
     release and keep soname.

Either way means we have to patch upstream build system.

I've choosen the 2) way, by providing missing ldb-2.7.1.syms
and ldb-2.7.2.syms files for ldb-2.8.0.  I'll have to keep the
old/missing .syms forever, they'll accumulate in debian/patches/
with time.  This is not bad actually, since it's static contents.

I'm not sure what value such versioning gives if it forces
downstream to jump though hoops like this. But here we are.

Thinking about it more, I'd just remove this @LDB_foo suffixing
entirely, - it will be much easier to deal with.  Unfortunately
this means we'll have to bump the soname again, or try to provide
both versioned and unversioned symbols somehow, - which means
patching waf which is not static target - which I'd try to avoid
since it means constant maintenance with each waf update.

JFYI, and thanks,

/mjt

