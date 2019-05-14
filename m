Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524C1C1C8
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 07:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=njhZGLBrex8CU/6Ur8oVF/IdItNE864kB+Kwc8z13Jc=; b=o3mWjTSGg8lVSRAE9xfzZBlpb1
	cI9VJCDefYsSE1Zjfw8Bv0HkGIRwsWsX0lvE1iz0oGuOlz1gsOd9rEclkiOecW/Ufvop4Iiv7ETMU
	DDCWm0LJRZQNUDotkwr1SHryadcRorqsLeAPJagLWgdfXJYR4G5zkUcfS9xnf3/DBVIfrcvqpg1C3
	uwdIH/6KR/dM5MtNsOHTMpuPEVQrx2uRSELS8U7wnqZ778W7CNeybppwwF8XBnq3WXKB4M0ZtUAga
	6GF0WicWMYXTVEVHztTM47b1LQ0VldaeysnDKeXoRo/Jn9IUUH+DcCspP9a6atwbc94jAggTgL6Md
	tq7OA9Yg==;
Received: from localhost ([::1]:58980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQPvJ-003RM2-8Y; Tue, 14 May 2019 05:24:21 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37326) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQPvD-003RLv-OC
 for samba-technical@lists.samba.org; Tue, 14 May 2019 05:24:17 +0000
Received: by mail-oi1-x242.google.com with SMTP id f4so3837817oib.4
 for <samba-technical@lists.samba.org>; Mon, 13 May 2019 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njhZGLBrex8CU/6Ur8oVF/IdItNE864kB+Kwc8z13Jc=;
 b=swvxiy2ZTicfKDRpTR6k0LdX9CiDk9PiRzlmacZZ9yivstojVBSN7iuTubsCMmjoZI
 j/uxIALlpWoP6qmUvP591vLLr5g9CcEOzuiJ14ZRjn4PLPWRKANqw6oF/z452fXo7IVS
 B2xLtOoKO/ON7AJWiHeNmzHj+iAM6l8hdLAKnw1TRZVmHuHL3iXTFhE53eMti93fdA7v
 udpxQtqUjVbBc9BflxdgP9Sqd1mZ5Ab7v+4aB4KmWk5YgiJn8WL67XpeHzhesESFQMLF
 LcoUndcwEAzcIli/1m0oFkFTYBgRpzGp0cKhxPOmpRYktmXOcx8Cu6zFtm7pq5rkHmiU
 5xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njhZGLBrex8CU/6Ur8oVF/IdItNE864kB+Kwc8z13Jc=;
 b=NBwU1yjgtgVyDMIOPK0FulHNZLnXS9K54tzLLkujR3jo82NKjft4V90X/9BbL27ohe
 D5Mw2WNuMJ3+Tl1r117WchpIZH4gc1CA+wgWMDo9hu+Vn3N0Q29TfpPQjQzldgznbivC
 Tyfzy6wWoMvLtW8A25eXz5Rdbk/x3SCn5qQO/CQ96bYaGQRLwkOd+S+hKWLpm8s/+GRC
 +MLiazAhJawo2oevzKRm1F9D1sVzS+pFLoNcI7eyRUfWsYrUTRmvc2Zb73LaosPxpxfP
 cKWohOXJHmuTB4cZ3TA/hGJdj+O/g+e0tD+q7ZgfwJ3uQt4OqoiNkD+DSxJuiDdtNDL2
 Ti7g==
X-Gm-Message-State: APjAAAW8MjOtC2n1jm2dmdpxlL667JMmQAevDiB0X/yUmKU7YTf6Jfbc
 IaEToLo87y+i5TxFG6jLFZX+kHDhvaFISaeEhW8wKw==
X-Google-Smtp-Source: APXvYqw0B/7w1+Yy9/Bb65VdZysgD215zc/0PU402FLee+mw2BDPCofkYvE6ViRJMxtMwHbdbTDHisBfY7leXG6mRy8=
X-Received: by 2002:aca:4781:: with SMTP id u123mr1817886oia.31.1557811453630; 
 Mon, 13 May 2019 22:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190514144801.2d476fdb@martins.ozlabs.org>
In-Reply-To: <20190514144801.2d476fdb@martins.ozlabs.org>
Date: Tue, 14 May 2019 15:24:02 +1000
Message-ID: <CAJ+X7mTaHshazofyFr7tAFi+t8t9rBWbe61j7deS58wYjT-GXQ@mail.gmail.com>
Subject: Re: [PATCH] Fix CTDB memory leaks (bug #13943)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 14, 2019 at 2:48 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Fix 3 memory leaks in CTDB eventd and recoverd.
>
> Includes one patch from Amitay already reviewed by me.
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

