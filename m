Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076F18559F
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 12:31:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wZXLdrV2kXa8CQ5pxEgn2qg5XbdMj21rWvZlw1OPJ/Y=; b=1ahuNgF9jZpAhgTuxofUE3n3ni
	D7u0NIQa/jAAZVuHUyOcOIguirf5jcAD+s1Snh9c/6ikxM/8G49GuYGNuBTLyVxfOId48SyGagPgZ
	V1i7u3/f0bq02kACef5kqmi1f+p/dA9IpRzYLjAiFPN1iM0me1BKmaGGdRmu1wlb22vGRKYtR3UtS
	mPlbZwGVJOhZi5Qy4d/BZ0x8sL8QJDUQ7HCMgRhqDUA8ApmY8EHYlqyhluQ14MNFVYSn4/sgw+Vsr
	+G9/KTFQnQNIZ4kJgjGq7Z/HAOxyptay1gl8S7IagWcD42BCL2nI0W0xxWzG6+VIXPIbIoBEAUSal
	Wh/DE8MQ==;
Received: from ip6-localhost ([::1]:37428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD4zs-00G3dz-Mh; Sat, 14 Mar 2020 11:30:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD4zn-00G3dr-RJ
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 11:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=wZXLdrV2kXa8CQ5pxEgn2qg5XbdMj21rWvZlw1OPJ/Y=; b=LFXdb1MBsx1FuKfcEbVNv9NMgO
 BD7B4Fo4ztYiWQpO+Rv4PN/7EMS/ttYkJfRY9MnGYZaFZy0rEhnG3YHkVwoJGboetybsKn3f/Fm74
 KleEeQLhz7PIgUawYK1e2d2C4lHI1GDjbOb4XGfcaK+TZPY/ASTbba1czSHINNum6zSoyvHMj1zSS
 bZmQQ+O7OcaO8l13s2CBUwD1YYdHIR0//RvjORvab56ZSDcjEiMmYa639+tr9f4GiFXC72SF0wIMb
 e/eagJGVurqTUWGAZ916SoVMs9T15yyFiugs+OzTqlT/23W4wIU8BzcgNcH2h4ud6sJvuVy0YlUD+
 LfHEkTde2IvA8p/Rd8rTdnZujPBV2m/Y6dLl0wqG9AEynKI3K31RZmn6PqYq5ltcdJy362gBJCj7f
 ryTwIyytTo0ZMFoMrorZleDx9yoQF2XS7XqfFRVLLPeTHWZPfb9zDnOBgMmUjQ8IUbwQbo27BRnVY
 R+6EMCjVAerSLDmk2tMkAwC7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD4zm-00085q-1z; Sat, 14 Mar 2020 11:30:22 +0000
Subject: Re: Fighting waf for C preprocessor output.
To: Thomas Nagy <tnagy@waf.io>, Jeremy Allison <jra@samba.org>
References: <E1jD20v-0001Go-QB@rmmprod06.runbox>
Message-ID: <881d685a-b733-98b6-2ceb-1d52cc6805fc@samba.org>
Date: Sat, 14 Mar 2020 12:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <E1jD20v-0001Go-QB@rmmprod06.runbox>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 3/14/20 um 9:19 AM schrieb Thomas Nagy via samba-technical:
> WAF_CMD_FORMAT=string PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build

awesome! Added here:

https://wiki.samba.org/index.php/Waf#Debugging_builds

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

