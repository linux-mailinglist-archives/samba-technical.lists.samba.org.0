Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D93DE692849
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZamuEXhcVKZ56iZ3/bDfyhF3ja60Eault4YAmV7SNAQ=; b=RTBxXU2wVw3Njk3cKCAGRKRmBU
	m4J0Q4v++KQw/ve3AoMKrOsj4lsrqAiZIEgptTo8zi4I1LZ+W9U1+ur+ff4ku+MWzhBHEWrVlJL0E
	2FqBRGcVvpOC2QX47xmZbY9anXrG+XTui5YiJDTdBMts7ZCnVyhTxa65pUTt2PY0smE1Pr8mVUxs7
	Y1V5tNGr8+q5h0/EKDUWqF8lTjEdJoH4csfZUGgCivjwEpIsat+JIRtApJpMUlCREFD8kr0b56cjJ
	J+DquK1l3/DWnHQz0+7cq/qlV0d5b+5lyhE9eLxJO28E29RkGaVxOOBNzT0NQZLcHs7kyueS2yB28
	zC4tuOAw==;
Received: from ip6-localhost ([::1]:39032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZzS-00BEkv-JK; Fri, 10 Feb 2023 20:27:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZzM-00BEkm-FP
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:27:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ud5so18861702ejc.4
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZamuEXhcVKZ56iZ3/bDfyhF3ja60Eault4YAmV7SNAQ=;
 b=TsQKwX+1pP22FCPs56/vCyqzRlBYKeuKP+V+HcYEmqly8S8QflkfYnflBEP5lT6H5b
 F5OqDGoPLeri/hXpHRWaa+8lQPdUE2328dZc2DlNg611cY7QRaeODNzYeLtGw62oGpye
 2d9QF4GSiwH6uplYVACzSv0yvdtDNJX7mh9+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZamuEXhcVKZ56iZ3/bDfyhF3ja60Eault4YAmV7SNAQ=;
 b=YF9HFNKKkdVjm2qdoXajonGrSWyWhCdqClFraU8q/4FQzeNT09xVuEZ5LdsCv7AQ3n
 JAEz/A3Myi5zbxUhMr2iUXidPHhIG1YyCGIFFGoiMtD9Kdd8AMKH7SAn/icChaRsiKL8
 3F4DMUNJlFgXJbIzC9GTE1rdLu2Ji8EOyWoPPK+2lIgNlDp3oGcWE9z2zOHAGSXh+Ver
 KB9GFx1NfJbsRcnp/CuGeKwO7JCMrHCepyTYRcOdtI856pNqHXVdMXJ6D5o5LwMnEkXv
 HKu3JXV+fp+yvcjDl7OrdIEsqAiCPAQSxrlgycqyzUbsUzrM+z8cWjNDtM8NFRFfmZz4
 4jWw==
X-Gm-Message-State: AO0yUKUFETSkBA2BsN1VVsKm/9rfpt/uxxFDDEcpUl6HfkBt0pITogtx
 BQhruJELfzyTmDaEOB+Ri7ijtSRh0BLIhEs7HcU=
X-Google-Smtp-Source: AK7set+3Nrg+l3sdP/FVUP389ncpsYfNS+IXQZIAC3N+2VBeU7cz3lXZMpYKTj5el/xY3JEfiZmOmA==
X-Received: by 2002:a17:906:4995:b0:89b:6048:85d2 with SMTP id
 p21-20020a170906499500b0089b604885d2mr16231520eju.15.1676060839207; 
 Fri, 10 Feb 2023 12:27:19 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 ko3-20020a170907986300b0088b93bfa782sm2863724ejc.176.2023.02.10.12.27.18
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:27:18 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id m2so18798219ejb.8
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:27:18 -0800 (PST)
X-Received: by 2002:a17:906:9381:b0:878:8061:e114 with SMTP id
 l1-20020a170906938100b008788061e114mr1469478ejx.0.1676060838145; Fri, 10 Feb
 2023 12:27:18 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
 <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
In-Reply-To: <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
Date: Fri, 10 Feb 2023 12:27:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
Message-ID: <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Andy Lutomirski <luto@kernel.org>
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 11:56 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> i think this is almost exactly what Jeremy and Stefan are asking for
> re: notification when the system is done with a zero-copy send:

Yeah, right now it's all just "incremented page counts", I think.

Even the pipe code itself doesn't know about writes that have already
been done, but that are pending elsewhere.

You'd have to ask the target file descriptor itself about "how much do
you have pending" or something.

           Linus

