Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D62BB1ED
	for <lists+samba-technical@lfdr.de>; Fri, 20 Nov 2020 19:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PyL41ejr67vbOuJYwzrPW+j+PrXu6b+/Da9PuuUPyFs=; b=BzMuAI5Cziz4XPqbbo41E6MzBu
	D2b3+Pl4xN0hBunZDaj85u/rCAqL5hMUZQgTPMhT0pRzAtrRj9dYZVpOsoLzcrTIQDn5/YChfsEHK
	10e3JNRunWwnpy8yEjlWaZhfTmt9SH0Nm2ev/4C+h65AuuzzBMblwHLAZLHr0EjsxycpZwZkBYSEj
	RxsLzFy85gz2cICcj1mo+1+nGsENxQucwNrIwS/0AN9nWdhnXvudY7325/pjCz6ZPi0RUBaIYZ6ij
	b4Peu2W6+1wxg7E9F5YhI3Nj5eSGSfq73LHLlxYi71Rlli0VYhASELJr9GGJWz4SRgwA1S6HpHHUH
	83ichMfg==;
Received: from ip6-localhost ([::1]:49598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kgAnJ-002AZE-WD; Fri, 20 Nov 2020 18:06:02 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:43563) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kgAnF-002AZ7-0l
 for samba-technical@lists.samba.org; Fri, 20 Nov 2020 18:05:59 +0000
Received: by mail-yb1-xb42.google.com with SMTP id r127so5612424yba.10
 for <samba-technical@lists.samba.org>; Fri, 20 Nov 2020 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PyL41ejr67vbOuJYwzrPW+j+PrXu6b+/Da9PuuUPyFs=;
 b=svkWBUvzvyWsWvU5kdY56kcEidutkAU6Z3CvnMwhsmd1+S3f/2flhyUFYeyO0qjbmj
 +fU9UP3O/KB6A6uBGvpk7oKtx8exWAJfYP2a4EYs2MrrKhao1LfS2UzL2eTpiHNS38y+
 f8UYFjAzzHv03uSAtOcJwKm4hkm1vVGZFyxQybwk1MVson1Eo9k4GUBSXHKT5x/6O+Ht
 Dhv9+vchGja52X8chMPLMKzV+kHvuFWrQROsGW5zz8Er/BB0HxsIh3AdcwpvdPEmwkHo
 H9/Hs/2W059V3vTLPD9nhzcMERQCIRn7APqSekL5ZcPlSsyrO+aGip0H3wkYIMlsalhF
 hg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyL41ejr67vbOuJYwzrPW+j+PrXu6b+/Da9PuuUPyFs=;
 b=FGzzhY6uodTN2HEJU5rT/HrCFI2J1vaQnoRQcenXXB/bWfvj50I7I3NPsCZokVtkod
 XZxR4dZDuhhIlp73h/ji1+BkOPlU3Q11GCLmP2fVOWwiNFkbRPB8uok3D3P3Jzgo4ys9
 MmuVbT8mpVfaO/NbtXNLnx1lHhjY5Ad1hE+bEsws0Fr3Hi1jUI5Poz3Roe3+3qh7YYMA
 hJ3VeLrOEBB1NncLMcLiSYseQtA8Boh72etvTk3RL7D+j3L2fVpZG4AD4GVMHOM3N1fS
 baSal5hlmFBsp/fZdqzkUNZOFvppJ+zm7MFPiK4TD42hoBCPpdkNKoQV2gLIc5K/I4kN
 IPvg==
X-Gm-Message-State: AOAM533tEB8rhlLcwUWrYxCijPf2BBV29LHkDvjRLyDXYAjCoXoiZQmF
 x2/LFFCyI4jpYvGlQv77CgsXxR89qQSZDLopPafiVRoBsCY=
X-Google-Smtp-Source: ABdhPJw6WOhUxMwA1S+PqGmZv/0jsZLfkeDiIxo+iJ5Rw695x4kBHWz38CSYH8CtQbiDMyMD+iALj/iw3unmU3IAYuQ=
X-Received: by 2002:a25:2e41:: with SMTP id b1mr19728512ybn.384.1605895554853; 
 Fri, 20 Nov 2020 10:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20201119214042.6113-1-pboris@amazon.com>
In-Reply-To: <20201119214042.6113-1-pboris@amazon.com>
Date: Fri, 20 Nov 2020 13:05:44 -0500
Message-ID: <CAHhKpQ6ZRwzjm6mfp-cw9+zfT7_YW5iW6swDJQ5XKkiTC8A4uw@mail.gmail.com>
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
To: samba-technical <samba-technical@lists.samba.org>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I failed to mention that this patch is against
https://github.com/piastry/cifs-utils.git/next, due to other relevant
patches included there and not yet released to
git://git.samba.org/cifs-utils.git/master.

Thanks!

