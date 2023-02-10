Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F046928BD
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=s2Azvxdn84xto/x8V66pxCf76GAuLOkrFIRsWg8lS4s=; b=1EmrEv+KYmFGriZAkQNMPx/R/4
	9AOlxQcZaXRJGzasuHXRyKxiXMKhnnojmRy7LlqJMLC0fjofybxCfqM4USzJwWxkpqUaZugz5dtNY
	/M67xBLL2DTflBAorxLtJNrK1QRNZasQ7jbufrZ9kuTZC2X/M4ojMPYpXqJJu71/NuX+YlZTTG5KE
	OfN3VCKXhLpQKbh20cgxgWimQf3aGpU4LT7ge0Overv/eDXKFZ/pk3YDHU09zMfb3ztD0F3o1bmKL
	EoIBXbs/6Vi8M8zELGJZl5e05ZpnfJOao766nhS33IK88+x5Njd7aYlX5E/8EIxM2WoPPaP3t30U5
	bx1EWAEw==;
Received: from ip6-localhost ([::1]:54538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQaMy-00BIRY-Jh; Fri, 10 Feb 2023 20:51:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34747) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQaMu-00BIRO-MW
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:51:42 +0000
Received: by mail-ej1-x634.google.com with SMTP id qb15so16882347ejc.1
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s2Azvxdn84xto/x8V66pxCf76GAuLOkrFIRsWg8lS4s=;
 b=CExvujm0mDZb5b8Q0YyIk4qMEt2KO+XrVyPAus7CXHhyvaiDKton8DMFVNJsqauRlU
 nI1nneBrMPjQD5z0K9+CdqJYNcj8cP+aS9E0t7rQMDVkDPH9lCTi56TrRMFd1OP/EM6c
 8oYMudVstq0I+TSzaRmEBx/yV05z10/f7jbHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2Azvxdn84xto/x8V66pxCf76GAuLOkrFIRsWg8lS4s=;
 b=L5Q8dBeelVFe+5wbRoCUJd94Dq+6NVsdojsTFtQkev5a9mNAQ4ny5XAvyt2fwHnqpk
 o6PPcDc5LWQ3wWfBMKavg1iy53BWy/czj4LO6hPwkdhLmANdGBYynynYhgmiiVF8etK5
 TfAI+aChAEPNILDrxTwdelkbAST8VsVPhVy/+Hsl58kAo0N/6ZPNSJlPelYe9cUWFZSN
 7EswOavT1HK0XSJxSrOjEBdEXrWD0q3fMX1zvFQXxRUa/MsN72WQ7x/cXEkV78AxoeDD
 w4o0mFaOEnqneBOfeyCJ1FFeSktuzAAaxODYVa9jzuNLbVW0yAPR8BH1n2deb5pPHsXz
 +PCg==
X-Gm-Message-State: AO0yUKXpLC/4bUAVbJSuMtfTYE1WGBGkR5wySheKB0AdipdN6tUg0FeG
 1fFO5sh1d1ydNt4nxZBLt7EpvQAjuwqs5qWpJqI=
X-Google-Smtp-Source: AK7set+zEsXZSBgaLOVFAJKIwF655C2N89afXcI8/3LJLfUc/oiYCO++zzedeyL6EihX5n/n4QN5tQ==
X-Received: by 2002:a17:906:5f83:b0:873:1b57:b27f with SMTP id
 a3-20020a1709065f8300b008731b57b27fmr19556191eju.61.1676062299559; 
 Fri, 10 Feb 2023 12:51:39 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 x27-20020a170906135b00b007ae32daf4b9sm2854574ejb.106.2023.02.10.12.51.38
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:51:38 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id p26so18886557ejx.13
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:51:38 -0800 (PST)
X-Received: by 2002:a17:906:d217:b0:877:747e:f076 with SMTP id
 w23-20020a170906d21700b00877747ef076mr1548367ejz.0.1676062298057; Fri, 10 Feb
 2023 12:51:38 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
 <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
 <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
 <6858a9bd-a8aa-3eaa-979d-83e1743ce85e@samba.org>
In-Reply-To: <6858a9bd-a8aa-3eaa-979d-83e1743ce85e@samba.org>
Date: Fri, 10 Feb 2023 12:51:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=JeuB3aDX4yej=9SE-J6RR9LG28eRVfntkoQCPpHNpw@mail.gmail.com>
Message-ID: <CAHk-=wi=JeuB3aDX4yej=9SE-J6RR9LG28eRVfntkoQCPpHNpw@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Stefan Metzmacher <metze@samba.org>
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
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>, linux-crypto@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 12:45 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> I guess it would be easy to pass a flag (maybe SPLICE_F_FORCE_COPY)
> down to generic_file_splice_read() and let it create dedicated pages
> and use memcpy() from the page cache to the dedicated pages.

I really think you'd be much better off passing it off to the
*destination*, not the source.

The destination knows whether it needs to copy or not, and in the case
of at least networking, already has the copy option.

The destination might also already know whether it can use the data
synchronously, so that there isn't even any issue with "data may
change later".

In contrast, the source has no clue. It just knows "I'm a page cache
page". It would have to always copy.

               Linus

