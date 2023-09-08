Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4A798E9F
	for <lists+samba-technical@lfdr.de>; Fri,  8 Sep 2023 21:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XRi3AnCqnKhPRyllFB/Exrdg4F+odUk93I5176GfZYY=; b=OlheP3fLd6FEBZhXowzgi3Vbgz
	lgEklOJfSiprwO7z8Mq3ovrIFRqypL4uznY70K0VTr3BnZH2KkxI3vZkLWy7wRuQ/eG0dFWxYus9H
	QEoceCeX9eLqPER+QNPzBAl5M4zgndw4gct5NI5sh1dRvbjNvTDMIAYieJmmeMM7IXVq3uQ07Mh5b
	8Zk7OxQeKtRPEXvFuBbkSSYB9lSQzXBqCrGWcsopDTtFQj9kj5T53GLPWs2XDrZW/mejao8JIGXdy
	GG7MRfW1KTaIO4qBOPhDEr8VXf1o6Xepuu4yC7a0VCtcrBwIquQMJM7JcsykQDXfszoJs/v6yH+ck
	/kUnQVYA==;
Received: from ip6-localhost ([::1]:34556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qegmv-002GAI-Hp; Fri, 08 Sep 2023 19:05:05 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49157) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qegmp-002GA6-ME
 for samba-technical@lists.samba.org; Fri, 08 Sep 2023 19:05:03 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0953A20375
 for <samba-technical@lists.samba.org>; Fri,  8 Sep 2023 22:05:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2A26A26C04
 for <samba-technical@lists.samba.org>; Fri,  8 Sep 2023 22:04:49 +0300 (MSK)
Message-ID: <41985a01-8374-8f1a-5762-ededced82831@tls.msk.ru>
Date: Fri, 8 Sep 2023 22:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: two kerberos impls are used by samba now
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

FWIW.

Just noticed that all samba executables on debian (built with
internal heimdal) are linked with *two* sets of kerberos libs.

This is due to libtirpc, which is a replacement for the former
in-glibc RPC code, which uses libgssapi-krb5.

This should not be specific to debian but rather specific to
glibc.

Wonder how common symbols from two krb5 don't clash...

/mjt

