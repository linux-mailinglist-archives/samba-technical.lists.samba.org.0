Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E64263154
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 18:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cZRXNlzPvjjM554deXK8g4M/dMciBqMLLUtzokUKqjA=; b=WY31cyVjgRKFSWBV4PAuuQn+AS
	xCkS3YKu80EkiYBCJRR1f7vFmWkCAEQkIKUhyWtm5VzsefLdEXrSYEJLb57scPui9zdYl3Ol8+Et6
	Gf4xDALsTCtQ6ydPCT0OsCZcUogROVC82DuJ7i54zDdQszaXGjz73sL2dYJaikWjPytpBhJBkfYba
	qXibTtKjJzRapwqV5T2in0mkBmAaNm41HQL7Q1NCkCqZK5AI0lbREkKm+oyjQh4jpTxO9lN3TJX/F
	bVvyaovIvrWV63D9tb9jX1BMVStREV15R+ORFEwGw+p9+gdMZ+uvLVu0Ot2tlaTGpWBknBQOmRGOI
	78YCE6vw==;
Received: from localhost ([::1]:32734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kG2dA-004mzw-KH; Wed, 09 Sep 2020 16:07:32 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:33187) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG2d5-004mzp-WA
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 16:07:30 +0000
Received: by mail-qk1-x72a.google.com with SMTP id p4so2957667qkf.0
 for <samba-technical@lists.samba.org>; Wed, 09 Sep 2020 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cZRXNlzPvjjM554deXK8g4M/dMciBqMLLUtzokUKqjA=;
 b=tx2dXm4NgYoGolVYZLo349g8F8MBSuHFySVgKd5I3aOyLNPkzSjmU+fI6kuJ6AYyi3
 7oHvHLCjvRsttk99fTwIvF5WalTWLjfmnBlatzXRahRjHvglbbK3k7VXdUBozUwX2+ls
 HdON0K8Ea86oHHyIkyMR0Ur130RdhzzFk7ygNWsvS4wGzaR+lMDfW/Cf4CNF/DT0jCzI
 UpHt+L91uN/ZQTj1lyXLVf9wqAiLsDjhtcG6KVtxMSy9P+fIWnL0rnP01GMKY/cw0KJb
 VSNt3xAnq2jclMNLUCS8LEeYr3Sc2415vmF5RgzoW+q7V1GxMEIlYDwDdMN4Nc8VAgYY
 WVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cZRXNlzPvjjM554deXK8g4M/dMciBqMLLUtzokUKqjA=;
 b=e5lOokypMK5o1z+O23x2NTBMYZlXAhRTuAtIuU0K2IZgchq/UYArjd49fajam11ybv
 p4VvzHHupF1FuSe7rnKLKjX4t/qbBh2YcNRH9PEjPAgoa8b38u8rkfkKn2rQ18owwOYU
 1UX7pO62xezUNNyyQH/L/+9gvcuinBYfjYl5p/+GV86FSplDRUw34iIYIj9UDBEzB8y4
 Dr/JRbF93eTEuXPlY1ELDY7bE5lSliTup9zh/f05H7ghhS2Z38/1M7Iu5w8unOX9YAyN
 yO2xoJZQxiExYAAlnx3jKgFg8hA1rg7A8tbjkYYzHtz2eiOd39XiL9bZIyWxP0QpZrJE
 /vbQ==
X-Gm-Message-State: AOAM5338PyMg7hdcPSrRr8Bonfzt1jyw+RE2FHlWGtnJCP8zML93Unas
 aeDb0CPn4eGF+y6wa8SWW/e7gJIsol4i2O5tA+FofEMOmq8=
X-Google-Smtp-Source: ABdhPJwnglI+x607DKOoiQ9HTfwEihcULnle7r+1tj4y0LHLFh6y2gex7QjBLFtz4cocbjq5ejspdHptNNYSUDuUNVY=
X-Received: by 2002:a05:620a:1025:: with SMTP id
 a5mr3864469qkk.490.1599667643953; 
 Wed, 09 Sep 2020 09:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
In-Reply-To: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
Date: Wed, 9 Sep 2020 18:07:12 +0200
Message-ID: <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
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

On Tue, Sep 8, 2020 at 8:56 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On a member machine i couldn't trigger it as it seems the
> get_sorted_dc_list is done in the per-domain process (as well as the
> call to fork_child_dc_connect()), while here it happens in the main
> process.

To define what i mean, i made a hack to prevent the main process from
doing these calls, and the heavens didn't collapse, but i'm still
unclear on the design:
https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-winbind-hang

