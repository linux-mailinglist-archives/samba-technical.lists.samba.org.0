Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC331A65D
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 22:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DtgY7E8LKIyUfIK5qpNlXvVVtBCgiyJCK26CFxun3RY=; b=cliWN7PnHXuDMdeu2MS180mY5A
	w1ccJkEWgBXnxEasUI7HLHvVEM6iBiWmQ4naJenkxarus3kA+hNNeeK06GAfY0Wrdv6fd5lDCeW9/
	WhkILnNlip3dJJ2P0FJL+46tRNJQK8EQmvY426wpRqQpmYSieLS4ncb+T3UR380WxDQO7r65IsCQE
	Wc9Qvg1pb135WcumRzQxvjy5YEWSvJTEOdjAvsqofYrdPvtj800hGVvEbXUI0wdZHbaG04ItHzxXf
	vs3HPOztneAHpkeW52thKOrR/BKoq2u9G40rI9WC7yKPJOwntnExfSSDK5gnntdjexOOe0msoWf93
	tZcihrQQ==;
Received: from ip6-localhost ([::1]:47182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAfWx-00CS1b-K6; Fri, 12 Feb 2021 20:59:11 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43540) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAfWq-00CS1N-M0
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 20:59:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id d3so1335699lfg.10
 for <samba-technical@lists.samba.org>; Fri, 12 Feb 2021 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DtgY7E8LKIyUfIK5qpNlXvVVtBCgiyJCK26CFxun3RY=;
 b=a8LtrewE+8QMX2wV6psa+ThDQCOWjx2BGDlbNFCqzhGms3HpqKq0YrYQk2A8eVyR1V
 9ozowSEl++hWe0+yjPNBFR8fLQvmTX8BUZEbBMZCm/Koigp8tOJcmQxrpstFJ/hRILmr
 d46ri2PmP5kxPqgZIF8cncMuYiPFhmjy5ey5om32NL9QSLUL1SOEVjFE4Ava8AsAzPfz
 hsmEMgVKqjP8mrnUGdSKzaq74NJWULl5AuaeJgHDCoS2L7OlnBdzb3jqrpYGnB5w5YVA
 vyE6o7n2XSpYorVj0IBvMHvHHpJhE5c9U+zCHcyYzIKEpK0H36Imzv/dticE/XZ1qTPh
 fCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=DtgY7E8LKIyUfIK5qpNlXvVVtBCgiyJCK26CFxun3RY=;
 b=Kz7h2C/aBwkdua9/CYGm2DmfAaz+3+5crbHiLo/CEXfJLiI0WEBIeQBWjRrbWwom+y
 0zMZVPJsjMRHA37diuUUerpauYfzjku+IHd7nN2v/NaOAgiQcfmk4SPhMzLipPVJRMk+
 gaSMjIRHDBoi+1ibY3G/Mf2JVPOhi7EpwCKEBch13sFfq9AaYibOFknwztoINHxWqETJ
 8DWWrGBiclWH2Qlf2Gbm1GiBdkLRZ2e/kPspqUsRmj/YAso6toHN6EfrrSvgqDnqBDod
 hzEvDg/cAi3wsicMau4zZahGqbidtBK1FD+w9lp0ZKlJh1wNGVba69husdnwFC+T4WeM
 XjUg==
X-Gm-Message-State: AOAM5306BW5ZAsrBF+n1NK/cTYqN58F/YTbcpJ7O6bCxHxpcVOARH7jH
 pfQXRqRGYMGZpe1uubmMFJOUIJ0Z2zkFUk2o8viq6G0/UYs+Fw==
X-Google-Smtp-Source: ABdhPJzQEd4H+BmNaS/kwmAEzur60a4b0W9ruhsTdiTFaiLe0TY8VXzZR2m+7kMD6N9xD8a3Cw/vpA/i6aL9KhYozvw=
X-Received: by 2002:a05:6512:31c1:: with SMTP id
 j1mr2538588lfe.313.1613163543312; 
 Fri, 12 Feb 2021 12:59:03 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtYEj+WLy+oPSXEwS5sZ8+TNk_dU3PVx3ieBz2DFS94Sg@mail.gmail.com>
 <CAHk-=wja1Y8r5UKrmXcMFrS=VPkTPbkyK-vt8B9MBkEU4+-WLw@mail.gmail.com>
 <CAH2r5mtj+-xGDy-YN0JwSJAsgvB+HpQFCBi-zdTNXTRBY_Mteg@mail.gmail.com>
In-Reply-To: <CAH2r5mtj+-xGDy-YN0JwSJAsgvB+HpQFCBi-zdTNXTRBY_Mteg@mail.gmail.com>
Date: Fri, 12 Feb 2021 14:58:50 -0600
Message-ID: <CAH2r5msA8Odi04kV7tMd3bXzB5gapyNKn7HFUKC8Q1O=CgjD6A@mail.gmail.com>
Subject: Fwd: [GIT PULL] cifs fixes
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

FYI - Looks like samba.org is still down ...

fatal: unable to connect to git.samba.org:
git.samba.org[0: 46.4.18.183]: errno=3DConnection timed out
git.samba.org[1: 2a01:4f8:221:39d2::18:183]: errno=3DNetwork is unreachable

---------- Forwarded message ---------
From: Steve French <smfrench@gmail.com>
Date: Fri, Feb 12, 2021 at 2:39 PM
Subject: Re: [GIT PULL] cifs fixes
To: Linus Torvalds <torvalds@linux-foundation.org>, Stefan (metze)
Metzmacher <metze@samba.org>, Bj=C3=B6rn JACKE <bjacke@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


Metze/Bjorn,
Linus is right - samba.org is down for me (I also verified with JRA).
Any ETA on when it gets back up?

On Fri, Feb 12, 2021 at 2:05 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Feb 12, 2021 at 10:16 AM Steve French <smfrench@gmail.com> wrote:
> >
> >   git://git.samba.org/sfrench/cifs-2.6.git tags/5.11-rc7-smb3
>
> It looks like git.samba.org is feeling very sick and is not answering.
> Not git, not ping (but maybe icmp ping is blocked).
>
> Please give it a kick, or provide some other hosting mirror?
>
>            Linus



--
Thanks,

Steve


--=20
Thanks,

Steve

