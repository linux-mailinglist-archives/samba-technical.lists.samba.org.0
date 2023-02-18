Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA9069BA9D
	for <lists+samba-technical@lfdr.de>; Sat, 18 Feb 2023 16:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7q2Wg8S1rsfm30D7lgChP+RGLUmdPuKtGfy28d6nd2c=; b=epRhFAnXjwILHZuPfCyKkHRvGt
	w80+6TOjmmqV2ZfKgDW1S/iQwSJ4H1xNp+ay49qfnw0ThL3jpzYIhhyHOJK3mHtjlmH14qisNGxrV
	u/ZjCEG7t6S0wsYxcrhbpYf98kpErh80N0NKcjf3sdymuG5Dun57oCGrM+C2ZPmlmFUg6NEh7iDZj
	s/8nlv//r2SNiokaXZB7QKymCuXEdMQCdvUwGSx1MdDYeNKN+WrOlxIyUm4OFNF7YEL9MXBhVq1NA
	xPoi5G3+j4wmXYJKmwYpFGH6V1psaw6SL3sezGIzdQFXiapthdyktcgCn5Pbo+HJbJfFn8h/SzGWD
	8KwWN2DA==;
Received: from ip6-localhost ([::1]:47690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pTP03-00DBb7-JU; Sat, 18 Feb 2023 15:19:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:34690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pTOzz-00DBax-9B
 for samba-technical@lists.samba.org; Sat, 18 Feb 2023 15:19:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id w38so1410795lfu.1
 for <samba-technical@lists.samba.org>; Sat, 18 Feb 2023 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7q2Wg8S1rsfm30D7lgChP+RGLUmdPuKtGfy28d6nd2c=;
 b=Q+twZu/73PHUCZPn32nq0NgKH/rksz15uwZZFZqEIxVuq7cBUyB91DH9OFAkMhBZOZ
 25h4g1NLayShc27rvbNVkiohaUxWtzE8Ggc//EMsxd0HqhYXAftPtFojX5+lMfYHVmZP
 PXwIF10DE36X0lJNd/UsoMy2vlQlsUWT723LH09UTQtZIZ5aY8aqRnWSOc8UiAPiTTHL
 6fIoa9Gu54FZZWDRIEkiZg9RjNn0g++x8pTqJQIWfc0noFCtrvbfU715AePLjKoxCX/E
 If9AQx/7mZzIXoR9JgsZxE6WL3X9vbb3g5vMu2bVZDVCz12eYAHutrUL1o0GgMiFB4sZ
 LJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7q2Wg8S1rsfm30D7lgChP+RGLUmdPuKtGfy28d6nd2c=;
 b=uEFNd/CGCte324L3pOyNVqsgXXg9xGbNh+ssBFY/ALQWYuwmdFi3Q3sVFtHcD/0wfj
 SGXAXG1y++yvv1LO0Vb+SZ6UlvOvnP+C6G76I0UV8tDPrM+Ye291tW8UAmoGbq/YFsD/
 9bnpWKkrFqxqT9Lqn9J47h96wcmPKjt/wZX55ld9QovMGR2iNqxWZ+n0ZEnlIo/MqNUR
 bqFtoYY0dnO2z5bqWz94A/ek9wmLhabofPmhffizFd4FOsPIFptwcYYA5DginvcB2+OZ
 n3r2VfYjXCscoRgSNVG99Cb4tOAWs4vptaXG6qfPk9qLE0Em4ZSQaES5zrVHekEqCXVC
 BRJQ==
X-Gm-Message-State: AO0yUKXbHpPZliSoLZPtlE1X7QUaXUY+rxP0NuDwytZSTYOB0U+3qCU1
 ZXPoqTS1F/XbPq5UQ1jEmP/3xseLf/9GPe03H3U=
X-Google-Smtp-Source: AK7set9O89dNDCkMb+Ei/ZIH686OBETFP2ZLwTaSTkzyJBNq3dib4fxm87Hu9j1qs5CFBv5i1vz4rqvnBjNPBHRTCvQ=
X-Received: by 2002:a05:6512:501:b0:4d5:ca32:7bc3 with SMTP id
 o1-20020a056512050100b004d5ca327bc3mr1349945lfb.10.1676733577507; Sat, 18 Feb
 2023 07:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20230218002436.give.204-kees@kernel.org>
 <CAKYAXd9Y+wCbAy3a_W55fgb2Sy7M9UQUhR+XujaTKZ255YCjGg@mail.gmail.com>
In-Reply-To: <CAKYAXd9Y+wCbAy3a_W55fgb2Sy7M9UQUhR+XujaTKZ255YCjGg@mail.gmail.com>
Date: Sat, 18 Feb 2023 09:19:26 -0600
Message-ID: <CAH2r5msJ1ZogypaiiLQ=STiroEXULwJr71_ta_+ZamXSqzxgpA@mail.gmail.com>
Subject: Re: [PATCH v3] smb3: Replace smb2pdu 1-element arrays with flex-arrays
To: Namjae Jeon <linkinjeon@kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Kees Cook <keescook@chromium.org>, linux-cifs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending testing

On Fri, Feb 17, 2023 at 9:24 PM Namjae Jeon <linkinjeon@kernel.org> wrote:
>
> 2023-02-18 9:24 GMT+09:00, Kees Cook <keescook@chromium.org>:
> > The kernel is globally removing the ambiguous 0-length and 1-element
> > arrays in favor of flexible arrays, so that we can gain both compile-time
> > and run-time array bounds checking[1].
> >
> > Replace the trailing 1-element array with a flexible array in the
> > following structures:
> >
> >       struct smb2_err_rsp
> >       struct smb2_tree_connect_req
> >       struct smb2_negotiate_rsp
> >       struct smb2_sess_setup_req
> >       struct smb2_sess_setup_rsp
> >       struct smb2_read_req
> >       struct smb2_read_rsp
> >       struct smb2_write_req
> >       struct smb2_write_rsp
> >       struct smb2_query_directory_req
> >       struct smb2_query_directory_rsp
> >       struct smb2_set_info_req
> >       struct smb2_change_notify_rsp
> >       struct smb2_create_rsp
> >       struct smb2_query_info_req
> >       struct smb2_query_info_rsp
> >
> > Replace the trailing 1-element array with a flexible array, but leave
> > the existing structure padding:
> >
> >       struct smb2_file_all_info
> >       struct smb2_lock_req
> >
> > Adjust all related size calculations to match the changes to sizeof().
> >
> > No machine code output or .data section differences are produced after
> > these changes.
> >
> > [1] For lots of details, see both:
> >
> > https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> >     https://people.kernel.org/kees/bounded-flexible-arrays-in-c
> >
> > Cc: Steve French <sfrench@samba.org>
> > Cc: Paulo Alcantara <pc@cjr.nz>
> > Cc: Ronnie Sahlberg <lsahlber@redhat.com>
> > Cc: Shyam Prasad N <sprasad@microsoft.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Namjae Jeon <linkinjeon@kernel.org>
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
>
> Thanks!



-- 
Thanks,

Steve

