Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1ACDAAC2
	for <lists+samba-technical@lfdr.de>; Thu, 17 Oct 2019 13:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M4L0fLe9Rx86b/5JRlDaRQU22f7VBFsK4qs7KzVdzUU=; b=r9Kbp+AD3tXfGaNLRJ91GfbUrm
	QmAVL+AqzxmmGiLawy6ekW2nSDUv0kiWPY2ZlK9z4wV1pnFGbv3fQap54CKQOdXTr5Kr6Uae1lq3t
	uH44Re6y7bcYL6Sc3jAZvgj1luehYVvqMkz9UUEvAyQHTG1dahuRU51l2a+bHsTJD+B3ppRc8IZ/B
	57/15j+p1wq8+l+n40qPWIY4RCmpvQXgTyvS0tSmV82VYTTBjCJ0CcHaNkWCSQupzrq4LpE1UxEc8
	Vs8jdZr69Y0/gxz7Tpflr7FOq35VD/QX8g2vDEdV/TGqkwpXDTuvs4i8l06JyWo5WvLDGBNpWltYc
	axs3+e/A==;
Received: from localhost ([::1]:36884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iL3ZF-0001Ij-Mo; Thu, 17 Oct 2019 11:03:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3ZB-0001Ib-9t
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=M4L0fLe9Rx86b/5JRlDaRQU22f7VBFsK4qs7KzVdzUU=; b=F2FurxG+JdOBs37qCim0Iwqwf5
 dLZ18cyF9PAbAKJETsf86rcPdIfEME5OCB0JXjNhGLY7MUmgG8IcEzJSQG5zUqZ98pjr1mnj54Pif
 gTO9N3d1Q86JgTRhqxwEyfoRaxqHXIt+pTDayGYsR3QmWep/4rFJGFmE5L+i3PbCB95ZwGR2s+5lj
 XlxpYn8dN8qRrsBwv8yZknJmWvoaOxscXeHjUhXyFNVcIp/YjAcY35qkIxYlZXxtTwKbpKvqKvLqG
 LJEnvlt19LfAQrblOxPyyA0Ym8Crvj/FTm/IboRZEvVbRiU4sle3OwvbgMVeGMeTQ65H0AxRWLR6E
 JlY3za1ahXqgrg4hAKrtjFB7fuiXK4jAZxjUjYtuOHjgaJ3YDi8zq+EJWZRHeThlfq+GxFUyjJP4x
 XbqbGxBGlyUrmuBywLcOCyfchIdRmuy+F0fG0HhyZIe8A3aPs9OOnPQXA/BW6k5cThmCfYekaKg4P
 +WxLp+4ufbW3LsGnyiUIKg/u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3ZB-0000bB-0H
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 11:03:37 +0000
To: samba-technical@lists.samba.org
Subject: Code Review
Date: Thu, 17 Oct 2019 12:44:04 +0200
Message-ID: <1928715.89pbXDvyhR@magrathea>
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

we have 4 pages of Merge Requests on gitlab! There are a lot of MRs which are 
valid but nobody is reviewing them. Every month I try to look at MRs at page 4 
and ping people about fixing MRs and or asking for review.

Yesterday and today I closed several MRs.

a) When code bit rotting in MRs is frustrating especially for new
   contributors!
b) If you want code review, you should see it as your duty to also do code
   reviews!

Thank you Andrew for doing most of the reviews!

	
	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



