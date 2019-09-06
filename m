Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE334AAFCB
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 02:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Cc:Subject:Date:to;
	bh=Y/3CgXuEdcF9k7VSfODh2nnmijQyuosu02Egvembvn8=; b=26GJkNVEV/EigPwKvJBOkFNB0J
	PDiXg4Ti1oO0JOECcIgb2K6w1nJAREF9GGmnzQLVk9IboyyYqSIdMhW0qmtxLiVAnU/vjQTK+ia/i
	8LIQbx1/xE/ljnpEEueBv1j4xNpW58ewAWYuozhnfqHTGFDTMChsHXjf4OdWccQwzwKMbxuQAWA4C
	2bQbvyJgrW4yqEv7A7GaPWuF5MbaC0NfXEB6lc557kiCq4WnUj0kJJRYyf0Bwka0BMZX0k0yOZ9dT
	8s2qfmWqq6Xfh+vgD6GAGnnTnzBlnTRNX/1ZcUDYTDqqYkhMw+45PNa/LrizhLGWw3y/7ap5ke3zo
	4uXqdYiQ==;
Received: from localhost ([::1]:31160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i61yl-003qK9-P6; Fri, 06 Sep 2019 00:19:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43845) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i61yh-003qK2-8c
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 00:19:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id y8so4660382wrn.10
 for <samba-technical@lists.samba.org>; Thu, 05 Sep 2019 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=Y/3CgXuEdcF9k7VSfODh2nnmijQyuosu02Egvembvn8=;
 b=qYuqfuF5aZwoe2EKBzeExGhnVXaF2Wn3tFb0DLry9NppA45BoBH7KvubeSjg2oez2c
 wQW4hDXR/IIWtov2gKMIWiYDwWJCxPeuIiI4REq5SddHX7Ba4p6LG8Y4IDA3akXaaN1N
 KQGCI3oS8cusvQYQ5Rdyo2Jz6ACTUophLnFza41mnvANnMTdyQv6Lm4Y9AY78mzf0/nv
 LAzDiGnQsUxjLOy9gplh5ObqlIxeiMvswSpb/7UVCGS8IRK7eT/lHgdqUHQ/AZ5BX0N6
 xEMOUM2/6U9aQxudlS9KCNurCA59S50J6eRCe2HztE5CFoaROcoPbofD78DJcu6OKhuc
 kpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=Y/3CgXuEdcF9k7VSfODh2nnmijQyuosu02Egvembvn8=;
 b=ip44EopruzWeJeM+m+xjoxzsgx876kn0bSnT2qJx1i06CJ9Zf33xd+e1dibE7Ez38X
 aPui0iBUUfF62QTbNEpHB9J7eVUUq8++OxGKD6XF0FwGg43Xu99rRx5xDat5Gn2jd7Ke
 waA7ZcapEVJytP6Sw7LQFV/2d6dPZM5OPAhIXcu9ZoL6hrXgrvmgdXXzabfqAYuUqYfB
 /paxk4QAJjwIWZgHku+uEMaU/2MuTKLYepz45lBIOg5wg/eXYaJ3B9J2CinK2V4BG0xk
 FdlP5maLcH7QHA32o61I2rNj8U4slyS1pODrYYQ8k0mXXmjHfDMnpfguFnjOhPgWE8id
 pmxQ==
X-Gm-Message-State: APjAAAXWy+FF7UBf9sh3F2PpALQxMzV2DYB4mSl4qz7cwU0NY2z9ZvSA
 J4hyR1YP52f3AUT/S3Q2JgqX0CPVkJgp2PeJg5+16Q==
X-Google-Smtp-Source: APXvYqzey0VH0vZwfSbTXtNxMLGpAI0qqtBsSpFgP7MSsq8GivFBniY78Bnv696z/LjRFBdDQW7BP/biT4VfgV25aNA=
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr4897350wrn.121.1567729189223; 
 Thu, 05 Sep 2019 17:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
In-Reply-To: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
Date: Fri, 6 Sep 2019 08:19:36 +0800
Message-ID: <CAC6SzHJL0V6OeHR+tLgGAvXDTE5+cqsMVNT9Nv6-9vEf9T=p9g@mail.gmail.com>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: d tbsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: d tbsky <tbskyd@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
>
> It is quite late for Samba 4.11 but I wondered what folks would think
> of marking 'encrypt passwords' as deprecated so we can consider to
> remove this code in Samba 4.12 (eg master) later this year?

sorry I am just a user so I don't know how hard to maintain these old protocols.
will freedos still connect samba without these old stuff?
freedos is a living project and I hope it can still use with samba...

