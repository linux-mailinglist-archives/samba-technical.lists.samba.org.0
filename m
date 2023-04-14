Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F213C6E2A1D
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 20:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OG+8c1tAOJvwOvGi450BzI/6idLjciZi6kYQZkj0N8U=; b=ZKwekTqUWL36FdW7484OYXf7GN
	OpYhFsmL6Ba26dzII1WGepxdWpV16eiycYoYnpVSVah9AHx4es5FReAOAmXQo/ON1o0tkvWuYE7oJ
	AqsjGhbzLLeLXSzbsjA1RXWzxhLmi3iTAHJjlv57oAmPAw3xwvO6j86Sss4AfaryIg0kcUE+oXovX
	MC0kjN4nwTyyvaUkhXH57H1kNSwwrEjiyEPTRDpo2RZz22tPy2b0rywp489hL2EcaMeODEhfHJU/4
	O9argnUiQkCw+4PhjfAoZapIHrEJhXc9pGjBm6A8NX68rrHdWJh3hjn53hzsLN4Tt9CNlbApk4m+k
	ldKdL8JQ==;
Received: from ip6-localhost ([::1]:23944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnOEB-001suJ-25; Fri, 14 Apr 2023 18:32:55 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37487) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnOE5-001suA-1b
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 18:32:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 x8-20020a17090a6b4800b002474c5d3367so1404993pjl.2
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1681497164; x=1684089164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OG+8c1tAOJvwOvGi450BzI/6idLjciZi6kYQZkj0N8U=;
 b=R7SXpcSC/Xo1j2GepAVB+9VhyVDTVp9be27q8LLR4iEVdQX27h8Wge5lPClK+7vXXA
 +EQ+096m6xfUKjVNIiEtbgf165pJliQfxzV0kWuPey3rUpfxqHB7rY2rq9OAgJ7SFble
 UW/g7STBKQAVgA25z614iuP9jB6ERoPHrpSSACOF2KfHJYPvbwk4nU+J2ySUc7etlsE5
 IbwQ7dW7xNlvexaQk0/IpMqzIU3KIPBpPGMqOPh9hPR9C9mIm5RaAs6UM9EcTFZPNbZ9
 VjJsow514BSoP+tHwf9B9LcysU2+5YLExa+koXlujlHcf3dPxH8Xj9r4GrSSj6VM+E71
 RbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681497164; x=1684089164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OG+8c1tAOJvwOvGi450BzI/6idLjciZi6kYQZkj0N8U=;
 b=Mr862DBpI5/BlHOR7/ZcLwVxxvx6hH2ddc0nyrqz0gTINqBVk95TlXf58Rm1jZ2MPh
 fneMGCFDMIxlz5Qs9/iWyLkWd7BOz/TGOW6aCudaWLMPKWHzSnNNr6w5w81Ogh+XVCjC
 etLm40rrUfq5FWSHEtg/i+pFAK6qz9HnmBGu+aLz8zp6e4kSeWvIXXevuWdNcw+Ipd5T
 +qjrTyTwEpMvlhrEMsf8BdK5F7nBH2ZmRhUp8/YSDp9xhnIjnz0iAAc4BbzGzcscWQIF
 xiWJGYkJm7es3425bo8eGSwlG9LF+InEqYaGdQ1KtL+FD3EkyimpH2J1ZLR/8kFiiuna
 Rflw==
X-Gm-Message-State: AAQBX9coquVT7COPVUpmkB0ks7mUxir9l5hunGkG/7XQult26x0gXS8U
 XIUDj/qdmMcPTC3xbkGSM+vBWT9CeLzi7ZHKTYG/agExgv5gAh7IfC8TTw==
X-Google-Smtp-Source: AKy350bITz/Sazm7d2i3mk3KGUIJc9TmmUrqUyd98y12R3l4wrANBKEJRwCZwHeoQmQZskxrSXqu9rFwnapdRUs8108=
X-Received: by 2002:a17:90a:670e:b0:247:2d9d:4722 with SMTP id
 n14-20020a17090a670e00b002472d9d4722mr4874795pjj.0.1681497164089; Fri, 14 Apr
 2023 11:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <3161922.5fSG56mABF@magrathea>
In-Reply-To: <3161922.5fSG56mABF@magrathea>
Date: Fri, 14 Apr 2023 13:32:33 -0500
Message-ID: <CAB5c7xqj=X77E6roZhfnaRewLtfdzwPx2SE4rodRFvKB75MfBg@mail.gmail.com>
Subject: Re: talloc vs malloc speed
To: Andreas Schneider <asn@samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: fweimer@redhat.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was playing around with building talloc with jemalloc not too long
ago https://github.com/truenas/samba/pull/241/commits/2476bfd3012a95e8015e2=
b61d3475d6f8cf11476
Some thoughts:
1) there was some benefit to removing the memlimit API. Might be worth
a shot retesting with it ripped out at different optimizations levels.
2) there was also some benefit for case of talloc_zero() if we called
directly into calloc() rather than doing malloc() followed by
memset().

Andrew

On Fri, Apr 14, 2023 at 1:12=E2=80=AFPM Andreas Schneider via samba-technic=
al
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Florian Weimer implemented hwcaps support in glibc. This allows you to dr=
op
> optimized libraries.
>
> The support for this is enabled in openSUSE Tumbleweed right now [1]. I'v=
e
> enabled it for libtalloc as you want to to be as fast as possible.
>
>
> Here are the results from my AMD Ryzen 9 3900X 12-Core processor.
>
> talloc x86_64_v1 (testsuite compiled with -O0)
>
> test: speed
> # TALLOC VS MALLOC SPEED
> talloc:       46623469 ops/sec
> talloc_pool:  74121933 ops/sec
> malloc:       66443400 ops/sec
> success: speed
>
> =3D> talloc is 30% slower
>
>
>
> talloc x86_64_v3 (testsuite compiled with -O0)
>
> test: speed
> # TALLOC VS MALLOC SPEED
> talloc:       47783809 ops/sec
> talloc_pool:  75068595 ops/sec
> malloc:       68073710 ops/sec
> success: speed
>
> =3D> talloc is 30% slower
>
>
>
> talloc x86_64_v3 (testsuite compiled with -O2)
> test: speed
> # TALLOC VS MALLOC SPEED
> talloc:       50633005 ops/sec
> talloc_pool:  74245533 ops/sec
> malloc:      219259200 ops/sec
> success: speed
>
> =3D> talloc is 77% slower
>
>
> It looks like the optimizer is able to optimize the code a lot more if ma=
lloc
> is used.
>
> I wonder if it would be possible to give the optimizer more hints. Maybe
> Florian has some ideas :-)
>
>
> Best regards
>
>
>         Andreas
>
>
> P.S. The talloc website states it is 4% slower than malloc. This was prob=
ably
> a long long time ago ;-)
>
>
> [1] https://www.phoronix.com/news/glibc-hwcaps-RFC
> [2] https://news.opensuse.org/2023/03/02/tw-gains-optional-optimizations/
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>

