Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE329CFC
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 19:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JTCt1PHAHYt7/qGNdiJOHwUef+w27bvYDDqdHRGIroU=; b=FPUPJhq9+VzPw18v/KCI01pjAR
	66H5iVDEaBdhdw45FaYe2c6jOYdi6DOmXKkmllWQFDwqqMUj7UQ/ZX0zU9miW6jYS/7iqjIih9oGd
	qkAsnGtCmrm0iLickHr8acY0YAlRnzWtHZCSVvfAsaSvGqM7Z3cTdyEUd682SjXmp7r+n3PtSMDzO
	iuCATYv4G/hySzoVJgh7szoV+Ki0iZaOnDotX4GfC7Lo/F/Uhb58Frx7DNUk5iIw9a7baHIvASfl9
	L6UfXpOfniX32SyY4nlA/iweIJmyoCoKLBaEIc9hWbODg5BkiEF/YROqSDu1flIxJhiMTNsYH5qjI
	UhhcDT5w==;
Received: from localhost ([::1]:27602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUE1t-001dNE-29; Fri, 24 May 2019 17:30:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35572) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUE1n-001dN7-QZ
 for samba-technical@lists.samba.org; Fri, 24 May 2019 17:30:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d126so3525668pfd.2
 for <samba-technical@lists.samba.org>; Fri, 24 May 2019 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JTCt1PHAHYt7/qGNdiJOHwUef+w27bvYDDqdHRGIroU=;
 b=cLLc6ewPvsuiENefqrTnT1TFp29Kqz+flavOaMCmqGDoJHqG5SwdsahaR6MPcIJzqq
 BGaN4FxyeGtPpQ1ofTwpgu7f7PJon5K1HjGGdGo5+y6yw5ili26h8ikGqldsWinuOTnm
 mnJO88kYzGaX4zqFb0mf2PfHHF3oEEpNYJt+eKP3t8tZR0xIgTRZHZH5eYvEchxEvrv7
 Wr7NPxXMbldSi+1OQtjoEi0RbRrJz8VlUlu5BHYRp1J2fBe6GOCV2XMjjnpLeyrecQXg
 LLwxOCY/zS9MVsCaUyFZi4vYiue8iKUZ8JStpiX7949ZxEq3906She2E+r8Ic7alvV9U
 3evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JTCt1PHAHYt7/qGNdiJOHwUef+w27bvYDDqdHRGIroU=;
 b=IRMWeLwBIKhMVtGbbl3kFNMAyRISCDgDCtfHBxKerXtALkPrPW8jVE2FNFZByOZgi0
 8IFjR93EbaksHVolDGE/16sfUBp8bmWtRx2nV2lPcz9AU0jMmhy6rIpseWOep6luasgF
 WtNk7kcUZfacQKi7JVHwVgw+0hihB0nnfRlGNGFE+kvmLr8dcuDVEifNn1YfYP7Qb9cs
 dIEAdMvwe4UKiR7b98b/vEHx0k6gP0DZ7bKt6bWY1jxKybrjriH6i696npVct6Q46rxx
 e4vE/ILTNLT2c+x8o2BMMnSc19uanWTv8jPBdoTc/5srrIzXzc3R46xkd9dWOUf7qOL7
 LTgg==
X-Gm-Message-State: APjAAAVCow/fdIdl8N/LTlXnwF/VxFHO+8YBletK+koRiHo2iE6VzMxs
 7q2OMxlTyrVVPhm3je6j1jyh9JCnb5u8bt0k1vNZyg==
X-Google-Smtp-Source: APXvYqwakqVqqXZ1AQs13Okkf0vvpDZVlGjgnKM5/LBs9LzTy6+l2o3iuvTj+DTCG3IpNdEai49hFpdw0zl7xRgw8uE=
X-Received: by 2002:a63:fa16:: with SMTP id y22mr67354826pgh.15.1558719045187; 
 Fri, 24 May 2019 10:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
In-Reply-To: <2585169.WRIv5fHKiD@krikkit>
Date: Fri, 24 May 2019 12:30:33 -0500
Message-ID: <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
Subject: Re: Kerberos and Samba client tools
To: Andreas Schneider <asn@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A related question (to your "--user-kerberos=yes" (or auto) is "which
ticket will it use" and "can you get a ticket on the fly by specifying
this with userid and password" and can you override which users ticket
will be used in SMB3 session setup?

On Thu, May 23, 2019 at 12:42 AM Andreas Schneider <asn@samba.org> wrote:
>
> On Wednesday, 22 May 2019 16:52:16 CEST Steve French via samba-technical
> wrote:
> > I was noticing that the username and/or password seems to be ignored
> > in different (and possibly confusing to users) ways on various client
> > tools (smbcacls and smbclient for example) when you specify -k (for
> > Kerberos authentication).
>
> Hi Steve!
>
> > We probably need to figure out what behavior is expected - probably that
> > either 1) warn if you specify -U and -k together (since smbcacls ignores it
> > apparently) or
> > 2) actually use the -U when -k is specified to look for that specific
> > user in the kerberos credential cache, and if not found to prompt the
> > user for the kerberos password so we can authenticate (kinit or
> > equivalent) to Active Directory
>
> this is a known issue and is also an issue with FIPS support I'm working on. I
> will rewrite the code to offer a new option.
>
>         --use-kerberos=auto|yes|no
>
> Auto will be the default which means we try kerberos by default and fallback
> to NTLM. YES means there will be no fallback and no means use NTLM.
>
> -k will mostly be working as before to not break any scripts.
>
> So I have a lot of work ahead and hope that makes sense.
>
>
> Best regards,
>
>
>    Andreas
>
>


-- 
Thanks,

Steve

