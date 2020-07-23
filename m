Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B411622B6EF
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 21:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZoP3XW1K9LPuOKSaRBCtPQzHoJ12mBdQrmM0GOmJr38=; b=kVb29vmNahdgQBFCutWyPah7Hk
	xeQShqdyTf/NtIAdafWJCR4X44qd4ivhorZN3e7Ho3XV1+vVv19Zo40PUoqp/S5ljIE7vwA61SRVj
	HDE4/dZPn+x2lf9QRxEjg3o+taa3CuVi/YeZ8JQIqY7TZopROuJ55Rpu/mdtT6jaag2IzsYJf7ox2
	v4sgE+R792m2KSNi7np0inf3ot2f3kebEc/mZu5T8ihkFx4tYsK/GcW2UyyVvwkTVDGK7Igw1sAkR
	iHuVQAQbOZQwethsBmKC+ArbP8IBGeAab9WRXNU603WPAxT75lIpx7Wf4Puzrk5pxs9kK6AGlApdv
	/dPgBNCg==;
Received: from localhost ([::1]:47182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyhDc-009Yh5-Cp; Thu, 23 Jul 2020 19:49:28 +0000
Received: from mail.pardus.org.tr ([193.140.98.156]:45468) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jyhDX-009Ygy-IS
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 19:49:25 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id B972B1F7929
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 22:49:20 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HndxKQ3vGNlq for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 22:49:20 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id 572ED1F792A
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 22:49:20 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DHPC8IZ2n3M0 for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 22:49:20 +0300 (+03)
Received: from [161.9.194.136] (unknown [161.9.194.136])
 by mail.pardus.org.tr (Postfix) with ESMTPSA id 2F6431F7929
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 22:49:20 +0300 (+03)
To: samba-technical@lists.samba.org
Subject: Re: Samba 4.12.5 Windows AD 2012R2 integration
Message-ID: <94a49801-479f-6693-b6c5-603697c798a5@pardus.org.tr>
Date: Thu, 23 Jul 2020 22:49:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: =?utf-8?q?Izzet_Ayd=C4=B1n_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Izzet_Ayd=c4=b1n?= <izzet.aydin@pardus.org.tr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We want to show to a customer possibility of using Samba instead of 
Windows AD, therefore first we need to add a samba dc beside windows 
2012 dc.



