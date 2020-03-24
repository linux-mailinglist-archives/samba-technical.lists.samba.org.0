Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600A190A0E
	for <lists+samba-technical@lfdr.de>; Tue, 24 Mar 2020 11:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=YIewyadYoMdPc0M2dvLU47jcz81NhnGtWL7Zj04jo7s=; b=w94B69iMkC0hbJQovCBUiVoGtI
	mmed65bagoCTaGwBqoYt4aATlt/6P94TPB78wXRNi0+jmt+Z9gl7abDBtrKRXiF8u+yvPK3opOf+B
	MfJIX1OEWXYoMEn7QxAwWNQOw29n+JQdpV+V9DjOD6K+6RcUyvTiS4T6zHW5glWNBkhs6dOplTBrs
	GmKtvvOmE+jckI/uRacWCyGvdvcdQ+TrOAW80lZwd70TdsLYIIwJlq6flVQvxk+WYmLXUNv1ZRKVP
	TVGem7UEZK1LQTP6zjfbVNoqz+5XoeQnNCtMCyiUNdbmHk0Kf4GCRayUGZ7MRpw/QHKpARl0NhlzB
	zQc8XSxQ==;
Received: from localhost ([::1]:27358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jGgMA-000XOL-JU; Tue, 24 Mar 2020 10:00:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10926) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGgM1-000XOC-TG
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 10:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=YIewyadYoMdPc0M2dvLU47jcz81NhnGtWL7Zj04jo7s=; b=0TD8O3qZ19h2YwD1UojfcUR1Pg
 KJxSKOg+blxY8e/cZIKMm1a8Lh7d/BVqU2PySNxYuktx7q/YJl4g2axl1kjMDUZSTyEDbOylP99NH
 iC2Cq7tUdy51V8/SFemmLFHsK4YoX8GyEviSDFNUCRv4+0OElqZqllq60R2NwMBsEfPmbzcp0Ptty
 23h3dWDQ/1lkPz6c4U563YCtLg0aVp6mvC8V2glixo6mZC6zEDNnW708asvmw0LL9SpEPqgHoo/MC
 OyvEl1U5YCyX/SPZtTBZ+O+SiYfVc/wMYnlMdc1MhcJPOM5IuCoEUXEvDy2SeInDIe5ePf15x64tr
 5voHKycQgw/FETG2O7RVcqS2GGSy6FHjTE4/juZTve1u1VEty4wCIRjkVGs3Db0SAWPKKXGTfgbqX
 QesP36y/KAGrniEJ+DJHbtUFXKGzt8jQrYUUrCcAenX5H/VKt8FKDY6jopV/CmC5Mc31M7bqx1+Wy
 TZkik+Uq8nMw23245rgFEDHA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGgLz-0004MF-T8
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 10:00:12 +0000
To: samba-technical@lists.samba.org
Subject: git signoff+ and review+
Date: Tue, 24 Mar 2020 11:00:11 +0100
Message-ID: <2070261.IvKQ8U6GgO@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hello,

as a daily task I have to sign commits and also add my review tag after 
inspection.

As git-filter-branch has been deprecated and the replacement is git-filter-
repo [1], I've written some really nice python tools to make my life easier.

In a git repository I and do:

git signoff+            # Add my signoff to commits I authored.
git signoff+ --by metze # Sign commits authored by metze,
                        # because he forgot :-)
git review+             # Add my RB tag to commits I'm not the
                        # author of or which has my sign tag
git review+ --by metze  # Add review by metze


metze is a shortcut, the name you specify is actually a file name placed in

~/.review

so metze is actually the file ~/.review/metze and the content is his name and 
mail address.

You can find 'git signoff+' at [2] and 'git review+' at [2]. Just put them in

~/bin/

and git will find them.


I hope they will be useful to others.



	Andreas


[1] https://github.com/newren/git-filter-repo/
[2] https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+
[3] https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



