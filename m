Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A586A8390C
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 08:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B2qmli6CMPQ66C4oGYeNbkN0qFDroYPh0O8XnINrcRw=; b=IU8nHFdunaAZMpIWSea63JVga1
	MZ/6R5Ta8AIdM788I7XnHVUb92IFCYMfp1uYQu+jpEPxTRGkjyz8mulNboedOnIIrX9X8U+KgR9Xl
	uEGetkEE30Lt4Hj7n4wcyoOMBfVB2E9fEj2U6tJuQ9lRLE4xPZpRKaIufz6/Uk33pkSRWzRXJEw9/
	ExgoTZAUqmmaDlzfzJkXMNHgDJhOKoND2TAu5tHvpM3AIKytFAZGnz/nNIzXasElfcOawswMVaa9w
	atJbleW4MDmKmhKor9kuehpzjTbnQRDRiK9fXngWzvl4745eqmYO+rFMmcWWHDv3E7pKWdIQ+4uBl
	y5JZNpvQ==;
Received: from ip6-localhost ([::1]:34300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2lFR-0026C9-Ep; Thu, 10 Apr 2025 06:18:49 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:57630) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2lFM-0026C2-Rs
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 06:18:47 +0000
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-af579e46b5dso367826a12.3
 for <samba-technical@lists.samba.org>; Wed, 09 Apr 2025 23:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744265909; x=1744870709; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1P1FJcD7e1Zii8T/GbaD8yL680Et7OWwCyn7Q04GRPk=;
 b=UQjfoLCEkULSfNXmQmKloSbgOeQq/qciLWsKqrtdlXVORzCwopABbDbcoEbqQ7Idy4
 PGaLDKXW7r+/RV6MCSjJibxEMtA8/nPvQbf0ZksZavJ0wqYluSpI1AoMJeMT0CmYUdGg
 xDyTlPgad27jDaNKPcVTj66uRMW+krG3nP343BQeB+cGCGG9mQnjVo8LIEkfIwVgEc8i
 0iro8FxZqCFjhGy/oaaVpwAL5QGweTFzOoa1iXK7y63Uz6IQhpoqUxQqNAf4oC1flo4p
 0o5BzRlJ4bOJyl5HSttBMufRVe2udannonB5qa1QLZjVYaRgmQNR7+HsFBV7DhE0NguR
 xGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744265909; x=1744870709;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1P1FJcD7e1Zii8T/GbaD8yL680Et7OWwCyn7Q04GRPk=;
 b=oZoURsXZcJvV7DoNBjjKK5Qmco7RioOX1nKxUfv9WOpQzGsuWCluCj0BHQyWWgVj+L
 JUW0oCLwMQ7Fd8vy6JJiInH8A0CU1+R2QkPZ1HbzIvsrYgLYDnQLNtzNKH1DXY71sddE
 9qM0MgkaGabM0dvugDMrnPFjDZqMX8sbBwcJbqnsvPpU49ifO3TOC/ZEod0+aGYcP+IV
 fATt2ZEMaVzbGNQczwXWb0sptbsL0YvrPf/ai0gWGtZ700ByIuysFhod7ltWItP1E5go
 xqMay+xXA3vFBje1PwTstUdi+gxgWH0+14lAtWy+HuWKqgbomCzEMml+3GNEGQNzKS68
 jWXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlYpegwxjr5davYjFEuAMQjH6BG1MqYFoRW3pGtBuRyylXxyNvfiLJSALm+myv4RzDj6Bn5kaxrPIIQUEjpZY=@lists.samba.org
X-Gm-Message-State: AOJu0YzLsRlVEL4bIvt9QT40SYa/BQ6Qg1TY7tj1+aYP+Zc4MvuI6/BY
 kgQh+lbqIQMkEJExXNEVUxc+9IXi82TvEfNr+V8+OhV9axb+zmoR/DD0cQc8u4nmdmNBg/+hmKO
 HxEyv9AhQfVfjpR+j0RWfpJeQxqM=
X-Gm-Gg: ASbGncvZpyRnHfxQIBEHbdpo/Hn2OtxCuh+f3qjb3xI/0CkLVpijVPHZwqTZUueHnWb
 5s0wJE2fPH6xHn+wSeJk102O46eT8/oVq1mMWbEAaOam5GTH778vUJyR0WH7FkaC9mmrLZi37Mp
 IEwE/r90Lnc/rr7vMbQFi9/w==
X-Google-Smtp-Source: AGHT+IFL7uGqSZhWiBwDxUoYz3wDCdfmcEBEGzBbU3KQ22p6opOGoVZ1y01+DrZpUrg8UtWWSJvFLIO+HcA4CKbArzA=
X-Received: by 2002:a17:90b:4d0c:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-307e5904ab2mr1790296a91.5.1744265909213; Wed, 09 Apr 2025
 23:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muEV7=ygqdCe+mrDgXXXtoEEF69HxgeWkD05Z1KY1jJ-A@mail.gmail.com>
In-Reply-To: <CAH2r5muEV7=ygqdCe+mrDgXXXtoEEF69HxgeWkD05Z1KY1jJ-A@mail.gmail.com>
Date: Thu, 10 Apr 2025 16:18:17 +1000
X-Gm-Features: ATxdqUErUEcuix8SZUdU5miVdHAi4YiMFQX6binCbJrWqb2ftizh7l4SHMsekQI
Message-ID: <CAN05THQGpzKTLXzFh8sc=h=rFQACBgFDhSzqNacrOp-50vGSOA@mail.gmail.com>
Subject: Re: Handling deleted files which are still open on the Linux client
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, CIFS <linux-cifs@vger.kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 9 Apr 2025 at 23:14, Steve French via samba-technical <
samba-technical@lists.samba.org> wrote:

> There was a suggestion (see attached patch) to change how we report
> errors on a file which is deleted (usually by the same Linux client)
> but still open (so "STATUS_DELETE_PENDING" if another process or
> client tries to open it).   It can be confusing when an open file is
> deleted to see it in "ls" output (until the file is closed and removed
> from the namespace).   This is not an issue when using the SMB3.1.1
> POSIX/Linux extensions but if the server were e.g. Windows it can be
> confusing.
>
> Currently we return "ENOENT" which is more accurate (since the file
> should not be displayed in directory listings, and attempts to open
> such a file should fail in order to obey POSIX/Linux semantics), but
> the suggestion in attached patch is to change that to "EBUSY" which
> may imply that the file will be accessible in the future (which in
> POSIX/Linux would not be the case so could be confusing).
>
> There may be better ways to handle this as well (e.g. simply filter
> out from query dir responses any files which we know are in delete
> pending state - since one common scenario is getting this error when
> doing an ls of a directory which contains an open file which has been
> deleted).
>

This is an area where it is impossible to match semantics exactly because
the semantics are just different.

Filtering the readdir results feels like the wrong thing to do. It is just
trading one
bad experience for another.
For example, if it is filtered out  and a client tries to create a new file
with the same
filename,   should they see "EEXIST"?
According to readdir() the object does not exist but if you try to create
it you can't because EEXIST.

IMHO the least bad option is probably to let the object show up in
readdir() but
return an error to applications that want to operate on it.
Maybe consiider such files as having the same behaviour as a "chattr +i"
file that has mode 0000
and can not be opened for reading neither data not attributes.



>
> One of my concerns is that with this change "stat
> /mnt/deleted-but-still-open-file" could return EBUSY which implies the
> filename still exists (which violates the whole point of delete in
> POSIX), and a simpler fix is to just make sure we don't show any files
> (e.g. in readdir) in delete pending state and make sure their dentries
> are gone.
>
> Any thoughts?
>
>
> --
> Thanks,
>
> Steve
>
