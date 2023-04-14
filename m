Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F26E1D2B
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 09:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HjW1JkrphR5BXhT0Gb2Ke6v4+GLokaZCKOJw5BMzBCQ=; b=WtjAjL0k0ZSbX3WRG0czVEPeKL
	DjUDKZfJA8LTEO9inD5UwVSRD+HAD70f5iYZB7QqlwC2mbLvdMEd+N8FbytSftysRuGTmb8i6rz/S
	zSO/JDX+7X7ST59QvdMhVUb6EG7vzd0TgbXpKoJ6hrQ22l9eK6pXr0tgLeWjXaZX6vnNHAH2EjBpa
	WiOZ9qSRMftO1TOwypPVr0kjlls01XwEDLY6xw5pnbeKYcQQTHMZF5cHhxkKKt0wJHZ2rjL20JgOy
	Espexhwxnzvz7J7f0LlObqNvjpVmR0gEE7NgpukZQ+uYopRWFOcXhvZU5/NFaik/Ok/nVbRXoAH7h
	DsIQPp1g==;
Received: from ip6-localhost ([::1]:23734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnDsq-001RCC-SG; Fri, 14 Apr 2023 07:30:13 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51789) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnDsi-001RC3-Hs
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 07:30:10 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DD4AF40107
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 10:30:00 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 788BE95
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 10:30:00 +0300 (MSK)
Message-ID: <351bac03-aa96-f89f-b73f-29486ecf2c75@msgid.tls.msk.ru>
Date: Fri, 14 Apr 2023 10:30:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: smbd tries to read ~root/* files
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
In-Reply-To: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

13.04.2023 21:56, Michael Tokarev via samba-technical пишет:
> While debugging an unrelated issue, I noticed some interesting things
> in smbd strace.  Here's one example:
> 
..
> openat(AT_FDCWD, "/root/.krb5/config", O_RDONLY) = -1 ENOENT
> openat(AT_FDCWD, "/etc/krb5.conf", O_RDONLY) = 4

> openat(AT_FDCWD, "/root/.hx509/config", O_RDONLY) = -1 ENOENT
> openat(AT_FDCWD, "/etc/hx509.conf", O_RDONLY) = -1 ENOENT
> 
> I *guess* this comes from heimdal code (but I might be wrong),
> and I think this is quite wrong to use ~root for samba configuration.

This is heimdal indeed,

lib/hx509/cert.c, heim_get_default_config_files(hx509_config_file, ...) and
lib/krb5/context.c, heim_prepend_config_files_default(filelist, krb5_config_file,..) and
lib/krb5/context.c, heim_get_default_config_files(krb5_config_file, "KRB5_CONFIG", ...).

(the *_config_file refers to ~/foo).

/mjt

