Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A63736AE
	for <lists+samba-technical@lfdr.de>; Wed,  5 May 2021 11:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZXSE6RNrSkF370PKNC8CNvofBxyRxCql/oy/LtRsTDE=; b=xiAOXbXWcytGfQDDbigF/jbFK9
	+JJn7UgK9ZBPFbr19TnwY5DKvKWXCLoYZIo/dOQv8uCtGHQrfmFpAylFAszWGl4Lzvoz734922+Lw
	SZyaF4b8ljOu94kl/JzVa3okYo0ASdz2k2EkBut/jRYJju3LfQo7yfqcHgOS7E7HVrrA8CQR0RkLq
	ye8X6WHu10raml9qZ5GwkRjfPnuEFij8SnzZlMbVtjQSS21p7eheXlClKmAibGWF+TfztPpjVJNsZ
	W3iREOqtOKDVoAyA30uAIItfO7sc3sFEpyjh/3xQDZZ0Eyuq0bJYF+35CxhWYRsgX1+Je7LPQx8f3
	6jdxR7Vg==;
Received: from ip6-localhost ([::1]:20838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leDNX-00FV7k-14; Wed, 05 May 2021 08:59:35 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:52238) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leDNP-00FV7b-FR
 for samba-technical@lists.samba.org; Wed, 05 May 2021 08:59:32 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 955D280E83
 for <samba-technical@lists.samba.org>; Wed,  5 May 2021 20:59:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1620205144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZXSE6RNrSkF370PKNC8CNvofBxyRxCql/oy/LtRsTDE=;
 b=CXwI2z+AfUOTuDdg+3b45iX1tGi9Pct4ACbTOS/Hi7nOlQ8ED5TsuhI+CDkuzr0TtGbr2P
 hLAz3l8y/zRthdTMpJMlqrq/kcg5mvPBUDHfo1EenB3eERaYj7RL3FdczInc9juDTvWRYu
 9J6ca4AgdfwXB5JPT42gd11CSvsoezlOppgpYwD95MxBJavSXTKIT5e9ilP01X4duSKi5M
 9g6ujqmisRNJ8sUdNZlNfzAkk+adWn+7yKNR+8K94exfQbHeQRpBabB9G/eNdEAWAWRu5L
 RcjRQGGuvqFSHMKQHGwIiKtKjHMLtNPG5bWe8gYDDoh9XxdwggU/uapc9vuxDA==
Subject: Samba XP fuzzing tutorial prerequisites
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <65193b15-12c8-72a3-36d9-fd730025e5b6@catalyst.net.nz>
Date: Wed, 5 May 2021 20:59:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Roughly tomorrow (depending on your timezone), at SambaXP, I will do a
sort of introductory tutorial to fuzzing Samba.

Most likely you don't need to read this because you are either not
attending SambaXP, or you are gong to watch Namjae Jeon talking about
cifsd/ksmbd and Ralph Böhme about VFS changes, both of which are
concurrent with this.

Also, it is completely OK to just follow along passively or discursively.
But if you *do* want to join in with actual fuzzing, it will help if you
have the following bits ready in advance.


1. A clean Samba git checkout, and all the build dependencies. On a bare
cloud instance, you can do something like:

$ git clone git://git.samba.org/samba.git
$ cd samba
$ sudo bootstrap/generated-dists/ubuntu2004/bootstrap.sh

replacing 'ubuntu2004' with something else there if it sounds more like
your distro. There are limited choices. For an existing samba tree, just
de-configure it with `rm -r bin`.


2. Honggfuzz and its compilation prerequisites

$ cd ..
$ git clone https://github.com/google/honggfuzz.git
$ sudo apt install libbfd-dev libunwind-dev clang-11
$ cd honggfuzz
$ make

It doesn't need to be clang-11; apparently anything >= clang-5 is OK.


3. The samba-fuzz-seeds repository

$ cd ..
$ git clone https://gitlab.com/samba-team/samba-fuzz-seeds.git

and you can just leave that one sitting there mysteriously for now.

Douglas


