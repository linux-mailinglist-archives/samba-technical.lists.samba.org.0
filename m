Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCDC67EEF5
	for <lists+samba-technical@lfdr.de>; Fri, 27 Jan 2023 20:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SK8kusx2oBl6JWbutnC2A9pzvdaTv2pj2a2j+fSbpsU=; b=OvieZpo/2qx06qSet4I0PsmA4x
	ifezyzfscXXKQc/iwDafsYJjZaWLYRLabDqaYlQYEuLHik/uHDbGE8AIXOJH9Wp+mErgAqxngcGAE
	6KjwSXFJgbWcwERlLYGJwA9GEsn/8KBDj2YM6wJvnA9+pcDYouKDkGnv/eCX8DeUwoUYn1JHbPqVY
	r/Of/EDkkqVWlgAqYoNBIhv3p3NTPUstyqcQXsq4ydIFjlzSlsVQlaY7FC++9uhM/b+0f4Hp4p8lr
	LFOa4qY0qfjhD3jVNZJAZqDUwa0QlzpqUgDqKKnmV5f+4lwd4S8EqmeFNjLG94WSuC8glnq3qsUtv
	n83hociQ==;
Received: from ip6-localhost ([::1]:58734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLUrL-003oBI-HE; Fri, 27 Jan 2023 19:58:03 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLUrG-003oB9-7Z
 for samba-technical@lists.samba.org; Fri, 27 Jan 2023 19:58:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id x5so5008285qti.3
 for <samba-technical@lists.samba.org>; Fri, 27 Jan 2023 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=otXjfIDUxnTRW9aqh3SYZNCzBAvs9L7kejWOM4NM7ek=;
 b=TSL86PG73YCQ8roU0KNNhT0XpqnnQCW2m5gy/Z/NevelXdZS9EdialQC2GeVXxVP62
 03rkP1bR54AEf7Rr2HFQ2stDAiixWEGXQENvyuNMdGcro8V0vx5H6j5NYUnGDVcxE9pA
 mJSGajbE3WsVzkNeLL3qwmv4Li2MXalgk1G/KE7DOPNpLoAs90DBMRw4/oKn+/MLODFX
 uf8MzuGGO/3WKM/04MTxRxds2vbQkoobW8JquNu31S/25k6G5j8op4Rj3IFOSFIF6RMN
 GeOAr8fKQP9YEyJQmpI0zCdVkvgj9AMl5ECxNVwKiADwC4iEjGk7te8rOfu5s9oLXXKK
 SWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=otXjfIDUxnTRW9aqh3SYZNCzBAvs9L7kejWOM4NM7ek=;
 b=wXyZovNbDXza5VnjMNjSvkFpd2LfEK176E2otM2tP0fYHUYOLm3yIJJm5i7RlciUzk
 tlTebQOWoGuXjXzk9c5LeiOLBMA4olnKRvTlA3tia+3dMi8fuuFLQgZf0E2EVlyZPu5t
 R6TFx/ffVAL/VXjlm3Ek69L50+mxYj1EfRXqNdQDLxyj1JzvNbOFN87o1FLASU2Ilv2C
 vSzuyeMwQ1gCG0OPqvOi/2Ro1XCzTRnZ0q1O3O88tPUm3rzL3QGFnYo12ol6GIIfD9Dn
 6Cgx+TIaeCCc+xmh2Kq7/4cWZB/itm5JqtN006tdWv8wjpPbWeCrzwrWRMR1zaHs5+qb
 Tq7g==
X-Gm-Message-State: AFqh2kr53xEtkU+PK0VNTxsktUGIVk3zqH0l0dG31FAnJjXaa3f0IKjE
 awGrN11RP3ks4J/yujYe/u9QcPHiFbmB7gW/AX+pc5QvxYw=
X-Google-Smtp-Source: AMrXdXs9T9MJ4/PFQnhO6rXRjQxOPlkXKQSoYjmuVOkXhZATnatbSA/ysRwxwBHA/YC8591M4JUi91aS9U02Huf1za0=
X-Received: by 2002:ac8:7d51:0:b0:3b7:eb3e:3a5e with SMTP id
 h17-20020ac87d51000000b003b7eb3e3a5emr974607qtb.485.1674849473180; Fri, 27
 Jan 2023 11:57:53 -0800 (PST)
MIME-Version: 1.0
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
In-Reply-To: <Y9QgJwNzUh9EQFQV@jeremy-acer>
Date: Sat, 28 Jan 2023 01:27:36 +0530
Message-ID: <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Wireshark will be the key. Compare between Windows server and Samba.

That is what I thought and have started looking. Any suggestions on which
call in particular, there are so many :)

BTW, with a Windows server, the flag is FILE_OPEN_IF


On Sat, Jan 28, 2023 at 12:34 AM Jeremy Allison <jra@samba.org> wrote:

> On Fri, Jan 27, 2023 at 07:28:03PM +0100, Ralph Boehme via samba-technical
> wrote:
> >On 1/27/23 19:14, varun mittal via samba-technical wrote:
> >>The SMB2 spec says that the application decides the CreateDisposition
> flag.
> >>Since the client is same in both cases, is there something in the initial
> >>responses by the server that would cause this ?
> >
> >well, the short answer is probably "no", as CreateDisposition flag is
> >client chosed, as you've already found out yourself. Otoh, *something*
> >seems to trigger the different behaviour and there may well be
> >differences in server behaviour, so I would check everything server
> >side that may affect wire behaviour starting at the top like checking
> >basic configuration down to the bottom ie compare every bit on the
> >wire with wireshark until you find the difference.
>
> Wireshark will be the key. Compare between Windows server and Samba.
>
