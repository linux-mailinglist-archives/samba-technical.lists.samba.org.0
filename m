Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94F27AA82
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 11:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AdB7vVo+Elp+d0o6XZCeW5srPUOaOfUM5v5Ln4Bny4A=; b=04ntNPnrbAI9ZyndGvLNFjpebk
	YTFaUr+CusLXzJx3eUwIVtIRGPLy4W+JW6pERivQaTdZD/6LWAW7bE9t0zyr0aUfyI/5ixLPpFhke
	s/l6xgxLDv7bjaAK1lHCWtfQvIec5Bl+kRh0nhTJuax0zH7hBPGyB1Z8I62GvTP2F4G1VbjrPdzJS
	GAUkZb4wkyKQHkU8DFL0aZYY0w0UfeEvd7hH8Tk/dNUKg/GxwiLnDA+/4Mmwax3ppjTkrLP9Hs9+b
	1gIcKoWdzqaPUfhTG6bsfR+wbUrdqXvyy4DAe8xRBwmRPBJL4zLwr3WDGVYnWhKCRNi2BhJ3Jer6U
	XRGeIw8w==;
Received: from ip6-localhost ([::1]:64506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMpHS-007fNu-U3; Mon, 28 Sep 2020 09:17:10 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:39052) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpHN-007fNn-Jy
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:17:07 +0000
Received: by mail-qv1-xf36.google.com with SMTP id z18so87226qvp.6
 for <samba-technical@lists.samba.org>; Mon, 28 Sep 2020 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AdB7vVo+Elp+d0o6XZCeW5srPUOaOfUM5v5Ln4Bny4A=;
 b=QCqaPuhvdqLVKMregY2fn2IeYSj8Ov4oqeuRLdkfi7d8TQICV2880eUobql0PDfrBH
 dA0K0I+nuHGm5iRRaJTbVvPgBNSLRyLbblsXYoj9wG6I8hDEUJkMVIy6/3I25JzP74IU
 7ggnnzdKdW+7JDRj7xMH+jqpIYYgo/r7xbvyAko0W425jAP3/WeRbEXGmlNb0plX/wWP
 p6LPx/OIDIya8cy97hEBZyR+81OoFKOBn1l47NvPrD6Wy1Dp3o7rRSX6UxkXgW2YPKfj
 Yzj6MeUY/PWwpdzxazDV3r08zMkPy1Ixi1A6zcqxQOFhf3LH8JSvPJXKy/zuCrTuTPUj
 2tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AdB7vVo+Elp+d0o6XZCeW5srPUOaOfUM5v5Ln4Bny4A=;
 b=AltV+nY2YZkX8HtSseSsuyu0jlIBze/KgkBwdCSKjR8emn4faSYQEsmAlqj3iD168k
 h8H1+6cmGAxk0c9Nm8U4QIwvfenTNFbVH4S7oOBXT0sFozeoJhQVmjoevB1HzhUfVTHC
 CwL/Kjhud8X38oYvPzn+7Mpp9j9f2/rVTD0LSxxAtZnQ8wLWRzxFGFbW7ooJ4RDZR/Ls
 5ixw1jYO1NEMmf5/JnC6SJwc7UNHgImDQBtqxWohzJ0DwLrV3GXW9x/XG2aX2ZV/v8J6
 UHzqGFkBmzDJQUbh00GdpZNkHpuEvugMXu4vWuX/ZROwil6PnhdNjTqa78oAd+fMDRND
 Jrwg==
X-Gm-Message-State: AOAM530fVJvAywQVjiJAb2rtyYckLhTV0YF3GUD2mf+Jdojlt/QN+yP0
 bCOVTuQVYXYWjH3e2iZosPNI/6MwdP0PUEUqlUtG8SBy
X-Google-Smtp-Source: ABdhPJwkJ2C4285SSre8c/YRs3s4G98iZueqRKr/YCbubaqUymBmfDEZzDkQBMnMtuioYhBMNwk/03HC8vT1WZvUe/k=
X-Received: by 2002:ad4:4f24:: with SMTP id fc4mr10987249qvb.35.1601284623493; 
 Mon, 28 Sep 2020 02:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
 <58ea03e2-f2ff-12b3-7369-aaa2288bf415@samba.org>
In-Reply-To: <58ea03e2-f2ff-12b3-7369-aaa2288bf415@samba.org>
Date: Mon, 28 Sep 2020 11:16:52 +0200
Message-ID: <CAC-fF8TXoZvoEvrEtSNVhZpOF+JBW4tqu8hEm810KrSr1p9FUQ@mail.gmail.com>
Subject: Re: winbindd callbacks not triggered
To: Rowland penny <rpenny@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 28, 2020 at 11:12 AM Rowland penny via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> > Thoughts?
> >
> Sounds to me like a misconfiguration in /etc/nsswitch.conf, running 'id
> root' should check /etc/passwd and /etc/group first. winbind shouldn't
> even be consulted.

Could be, but some of the failed requests are for domain users and groups.

