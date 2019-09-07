Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 004ECAC3B6
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 02:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uTTihvmpg0Cx7RX5j4M1Z5qbLeFhFqwraHGxiDLmcyI=; b=nfos0VDIQObQ7qdx02eieHcfFQ
	U9Xy7Hb8uLRSOGso8sfTQQv+n4bNweT8ExyVH3XbcMStuhpc7tlTIrwB7Psh+9XS+3/QRRUuodINC
	KE2lyjWJemVqLwsqiyUfiteZevDInFk02Mi0W5IzPv4ebTxk3gxQN7GYpxnQE3ogvkJ3hma8OPuhv
	kd8pJLVzUjsisNojWQA0Q+kGZggJGwjjXR0mmtuPEOea/lXuWvvxtL1s4sRb7A1k2gfZSi+jvHU4c
	ioVtG0h7R4nIubCLHJsY42riInpdFG+v+cjl/rEQeNnUT+P2wu6EVIM5BObslLs/zXF4VNvcUrX9/
	c1SvgMhA==;
Received: from localhost ([::1]:41046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6OoF-00489s-C4; Sat, 07 Sep 2019 00:42:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6OoA-00489l-4t
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 00:42:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id m9so3966809pls.8
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 17:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=from:content-transfer-encoding:mime-version:date:subject:message-id
 :references:in-reply-to:to;
 bh=uTTihvmpg0Cx7RX5j4M1Z5qbLeFhFqwraHGxiDLmcyI=;
 b=djbz4Qp0swOHIqyItMCnhVAjcgmKLKMoYS9TC2h71EWasHlrQBiVnGiWo4lZjBgXOz
 +5ksLUpPR+fFv0sSU4pPROanZ+rJZdFicjv3ri0xACS2d0Wnor8X6jAoxIQGa+WKzfUo
 VwjaBy2aIp3JmT5kTe63grhjfJ+jV740B5UEDmbutWzOCqhgnWFw12HNOfqU+sWo4n+h
 9yNR3AsSMutI1/k03YZacGv7V/+06qdi5o3Y6yoFS7sNhPgLrqBRkXXa+gcThiJaGcPx
 xDXikp6iKj4E+Lg2rhHES0mWyBSkgvl+7jPiXb6NYJuwnNULIQq9V0JzfLWqBmNX0XsQ
 Zy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
 :subject:message-id:references:in-reply-to:to;
 bh=uTTihvmpg0Cx7RX5j4M1Z5qbLeFhFqwraHGxiDLmcyI=;
 b=uBDYOD5mODDYou6Kf/IJmsFl2vsTTOLk3QyCuDWp/tPmsS8Z0JbaV1E9SOVIoAKvyk
 H/FN2gX6vFoS5Gn5x9gCX+209xRS6I0Onoppq3/C13KdTiR6Xg+M4D9nrRRyVjlqKrOl
 ehLD683aYnXUATo9QYF1e5TeZLDOiojZdTBsqiZzN857SonnANEmmhmKrlvxLqWDtHPX
 Mt5tFgFkYGnwRuTDxhp61Ccegt3LuMSLOMCD/q67rcfsQw/Odj/MCr9C4s49KwfLnG93
 RhODPy/xC1Hi6XBMuGzdBQb/Ne7+8neVe1Dw5zloMw/7TRlcKKqxds57Ku7R8rLnCOJu
 Cgmw==
X-Gm-Message-State: APjAAAVDClTTq+e6TPssdA1qUuXpVdjX4gXuZtVm12zdrFsdkuDHwwN3
 TcMfVfIuWst0vQ9JFN+L7bTxsul4ejnyLRqbgoIeepBrH2sKJWXJmhULzSOpzOEq5GX4sKtDih8
 RgeyfIhpNtOK76jdogDTUcJ3c2euvjXRSBPR3WTtQjNT5pgOZoET7UmLQvNJiDHB1hh2H+BtXTH
 5ZAW9H
X-Google-Smtp-Source: APXvYqx7a+JstNVdyNSe7EenXfVBAaktMvURMsNlPC8MJSLky1XT3N5NA/CQnogiXHHrmfN/fHCBuw==
X-Received: by 2002:a17:902:6a84:: with SMTP id
 n4mr12213787plk.109.1567816947917; 
 Fri, 06 Sep 2019 17:42:27 -0700 (PDT)
Received: from ?IPv6:2600:6c5d:5900:1e6:acd0:5a1:cee5:3ec2?
 ([2600:6c5d:5900:1e6:acd0:5a1:cee5:3ec2])
 by smtp.gmail.com with ESMTPSA id v27sm16185332pgn.76.2019.09.06.17.42.26
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 17:42:27 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Date: Fri, 6 Sep 2019 20:42:25 -0400
Subject: Re: samba performance difference between old and the latest ?
Message-Id: <A79AF92E-3404-487A-8697-9FA6F3B1D69A@ixsystems.com>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com> <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
 <20190906230552.GA37629@jra4>
 <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
In-Reply-To: <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
To: samba-technical@lists.samba.org
X-Mailer: iPhone Mail (16G102)
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We=E2=80=99re same aio settings used on both cases? Defaults changed in 4.9 I=
IRC.=

