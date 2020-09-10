Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E957626433E
	for <lists+samba-technical@lfdr.de>; Thu, 10 Sep 2020 12:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RxLYXK0+Rc6cT92tXuoU0upY1/bR0h7OoD678pdytn0=; b=wOrC5nqKM0kyH572czumzJ1lEU
	RAyN+8FeoWpmwCaTRDSxGD2TvuMmz7OhboanhHXGIb67M2D3Ig38Nzwlrl1n0duwahaivRu+4mVjV
	yC1WtuQ59vO85ZFEAoHos/l5u73sFKbaHVjGoKsQrvebuKWHCih94p9LwECM/wECbBhirkMSjNbzI
	vKUliU3EvIHyxnaXfTrKr4SH1myhCQ+jlBpe8Tu2rjnUiIfIqCpwHZy/uRpP3oNjAmk+HrI2r7EZy
	s+tcTRyyuDBileCNshmggZru6SSEnOFU9B7gW++pgtNS6qVFjENkG/LeuHIpCPSHD+6H0GKrV5D1z
	tZdqBdMg==;
Received: from localhost ([::1]:57188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGJTU-004rw8-RL; Thu, 10 Sep 2020 10:06:40 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:32849) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGJTQ-004rw1-MO
 for samba-technical@lists.samba.org; Thu, 10 Sep 2020 10:06:38 +0000
Received: by mail-qk1-x730.google.com with SMTP id p4so5481078qkf.0
 for <samba-technical@lists.samba.org>; Thu, 10 Sep 2020 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=RxLYXK0+Rc6cT92tXuoU0upY1/bR0h7OoD678pdytn0=;
 b=OtTz5pzGyhC2/OciDEKvALBtWYVY9/KaaPEtn4/Pmvn3R5kgTSZ6OndyPJgfYiG1D5
 hEban/iqU2A/Elwkuhp6G12drhqx2g9ADg0VTsz2kM/tZVOtvTEofOLlfTwGwPfG4nTo
 1sLrL78dvzkNSGTEB64qqeMGTpf3AUevOSVZ8xNzwWwmdnbAYTfkn132H4heiNclm3B+
 WVJ4V9hyWT+cJ1/NI/PWIqNf6gcSLAPgjn9BOuqPhLeFQ7/H3wSZlO9/a3cZsoJtNCGp
 kk+ZzOJHAHsREQPuhZ4FUr+JsmKEzmSL84yLSO9ad6NDP1ubG++ZRrBTsrDTQMOg9196
 G6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=RxLYXK0+Rc6cT92tXuoU0upY1/bR0h7OoD678pdytn0=;
 b=t7mqt1S/N0AcIRRel2J00c7jLlNyeSVViFJliiOhaHrDr3liJEZwnZtfQNGoVargCs
 SR0KZkUPotKhaH11Tt0/Or6aUzouu6ZFJe5Zt5Wh1e3oAhhzCZKF1EANPZj2QopGGzeS
 UiYI4nZtsyR84prKMx/b9OSb2KmkismZ+Yg3TKDy1r65GfP+B4mM+Y1Ky4Q0YP3vg97y
 G8kN/iy8ozyr5khvNvt6mUW0dP5h7+IpFJceGIcV3/zw9w4rQeFAoKvYCoUY7vpR41oj
 /4jqb6fnKP89sl7Y/hp8Nm866My4yG325vjRFOv/NIzHk7vqSkpmNtPllF1kI+/RgaJm
 PByA==
X-Gm-Message-State: AOAM533iI+/C4wNnPFnD7KXKkwcwBJjd2G1P52CvXgfN+7wdw9cOSoSn
 L7nRpDgFySW/hoFdenUxJjgw2MJwjAz8jtL5AodPjU40HBg=
X-Google-Smtp-Source: ABdhPJzJGqFi1AEasf/qDYNnm3xpmBl0uEokgVjPZ/7J5oVibYKK1+H/Rd9BnsDsfpxlKq9qX5a9OGSFTIYoxV50ny4=
X-Received: by 2002:a37:ac09:: with SMTP id e9mr7076836qkm.213.1599732393440; 
 Thu, 10 Sep 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
In-Reply-To: <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
Date: Thu, 10 Sep 2020 12:06:22 +0200
Message-ID: <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think there is no point trying to maintain domain->online per domain
in the parent process, we should just ask the domain child (fork one
if needed), and avoid ever trying to talk with a DC (sync) from the
main process.

