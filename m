Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE5D440A27
	for <lists+samba-technical@lfdr.de>; Sat, 30 Oct 2021 18:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bx5Jvopj/jMRtAFahqQ7rRNrzsTquK7C76t5hI785i0=; b=xFQNJOMrIOk8tNKUyK89cT3VRA
	4ysewQ2ukr05YQ6y5+FD5okjKs4luRpAvScn2SC5XGGh9nuoWo8I0K1Dobl0+1j1q1gzqX/QHPimw
	n5IyiDwF01jFnb9r03YdvQZykDyYZOl0VG1aGUGzdhu6gl91uh5qVyfKL/qphpQqksC0OfSeG2/7V
	MnYBYRdGiwWUqN3VzQpKaQv0JvYPoF+G8thQgAuaB4/oJ2ZXgjJmFNXHDJx5kJYqyAcrYACq0dJvQ
	CzJEPqwNGh8VRIQ+V0l1sR2MKEkS+Syw9XMBtvYXMVJ4MyPx20aevmzUa2gMlZ07os5sjN4wTkF30
	iWXNQF9Q==;
Received: from ip6-localhost ([::1]:45010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mgquL-002N5c-32; Sat, 30 Oct 2021 16:08:37 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:36385) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mgquE-002N5T-VV
 for samba-technical@lists.samba.org; Sat, 30 Oct 2021 16:08:34 +0000
Received: by mail-il1-x12c.google.com with SMTP id l13so13911232ilh.3
 for <samba-technical@lists.samba.org>; Sat, 30 Oct 2021 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EIioyvot0pULd4+jfl/fiGsucENDY/2mvh0vZBt0yzg=;
 b=Rdtzvpi08rFzsXh8Q91Qftc00xq+wWv2rzZbhmTLVHgLUOBP5R+V2CiJ//zUr5BZq2
 wr1QXVr3JFgEaATTkLZq/yPrtdgIIXQdNcW/3D4DftoNNEbD6FX5kF6JVOsASlI7J6Gh
 +Y0bWmH3RJve+7jBO28OveO3sqCfRg/wHx173ZH7vGn+a3vmkpu/3QeqEmvIJWN6OKS5
 zozF8f5PuA57y0/jy7m+1jRSYK2bzb20ZgYOepWqIf1vCpFK1zGA8pOnmpQJOexP9BBb
 wcN1uhlsxU+88AmwNL16LmcuZHARzGDo+wBsnQ/e3tvjY17Tv06PatkQQVPieO2WG9YL
 Y4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EIioyvot0pULd4+jfl/fiGsucENDY/2mvh0vZBt0yzg=;
 b=y2O+JPp8maVVjnb1bz9IzPrvR+pqRZs209juBCd52xVPc8KFer1NUsunyUkoy/pKVj
 O00iqAWQNX6yPuOXvyfE8Ly+r5Xzjw3jq0dRcl7ouGnsy2S58n4r1DUi0J/NX1XsJby6
 /2gABhTlIQOgEu/QYF6n8cG2UcfNLJG88UfBPKZHWm6tsCVpHIsw/NI0iAuJ10XzXpFG
 jQed22wo7kFftLMQGCB6zibVjEOAcpakOgkIrpZYgTmUG/vJQ8qQiaMNXoLo3NwzmVKI
 k6qmh6R+diLQ0vRtlkYV8SYIpPv0Y/2EUNCoyQqrO7o/6M0VHuIM133L+t7kmOTV3dd+
 WHdA==
X-Gm-Message-State: AOAM531OhG7dBGCk7XAi8bbMGl2Plqgj4Bk1/e6XSJDrhWwT5z8bcsEa
 yVSPFlNj+m/puCVX/3LHVcDGWLm3q4xqkJZne2M=
X-Google-Smtp-Source: ABdhPJww1mocDm5dJWivoXz+Flo+ynoCB3bH+rQ0nccN3Np1QM8w2bEMqtF8oF2DgoZTfKYHHzr2uHD9VKzBRKh2F+Y=
X-Received: by 2002:a05:6e02:b2e:: with SMTP id
 e14mr12330470ilu.47.1635610107707; 
 Sat, 30 Oct 2021 09:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALwZj3JLO3iRDkgHeHtUpYo4j7=Ck8eo+egAu0s+LTsny4o8TA@mail.gmail.com>
 <YWB+RusAvL91oAfS@jeremy-acer>
In-Reply-To: <YWB+RusAvL91oAfS@jeremy-acer>
Date: Sat, 30 Oct 2021 18:08:15 +0200
Message-ID: <CALwZj3+TotL+bchNpX1Z5PmZeF9c1LuNOGSziD9sN-BNgz5MpQ@mail.gmail.com>
Subject: Re: Samba name mangling change?
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Steffen Kern via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steffen Kern <kernsteffen1990@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you that helped. Unfortunately I had to realize that since version
3.00 mangled map was disabled. Is there a way to enable this again or
another method to make e.g. *.xlsx become *.xls?

Jeremy Allison <jra@samba.org> schrieb am Fr., 8. Okt. 2021, 19:22:

> On Fri, Oct 08, 2021 at 07:17:03PM +0200, Steffen Kern via samba-technical
> wrote:
> >I wanted to use my Ubuntu machine as a file server but I have programs
> that
> >still use 8dot3 names. I have already tested the name mangling of samba
> but
> >with hash as method I only have 5 characters of the original name and I
> >need at least 6 characters because many folders consist of preceeding
> >numbers like "2100001 test". so I would be interested if there is a way to
> >customize this
> >thanks in advance for at least looking at it
>
> Check out the smb.conf parameters:
>
> mangle prefix
> mangling char
> mangling method
>
> Hope this helps !
>
