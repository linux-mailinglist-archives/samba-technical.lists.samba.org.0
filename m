Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B366394BA6
	for <lists+samba-technical@lfdr.de>; Sat, 29 May 2021 12:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SlYuumgyWEyP+vul4UqtNKJX4xWK2JmUUfLRjKSxlWw=; b=zv4WcCD0kulqYdn/zNqm/CvZjc
	NXozlUXW+XwTtUc5nMJuBVqZIaw7J+FVT9hqvxsMS3FvL/XAgU4xE6N6VWfE3i9diNIfDK3Zt4gkV
	uuXfzreMSWStHOeCbmWWdx1qw3lryPDo773h6XH8Fq2f4HgQ/Y2/iTCBAJzqIKhllLpu1YSZZbJSd
	wgZYx3NsIivSXbMqkv7e0uQdZhdilogspDkJSOtB2F8kI3vAMBdc40ZJzxiwVY0/83Gsv/3+XSTwj
	adyyp5IODuu5xZsECCQHcpwvCOCP1T7uRhRR6maenmC5Yu0opXpmlrdA61faDLisGNlUzgiCnjtPX
	0Pvym0Fw==;
Received: from ip6-localhost ([::1]:65182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmw7s-005B68-5w; Sat, 29 May 2021 10:23:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmw7m-005B5z-DV
 for samba-technical@lists.samba.org; Sat, 29 May 2021 10:23:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id qq22so753849ejb.9
 for <samba-technical@lists.samba.org>; Sat, 29 May 2021 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27pChsRdCUQ59trojZLqLkVyYJb54ESW4YUjA/ZBzpI=;
 b=SzTwFn6x2agFOb4Acu5lFM04WPABv/acBLFZCYySXcEbEJ4MUK2jrsN4l7VsSybgu+
 +tM1J2UIElctIzUFX4WX/uq1bIe9FifNB4zmlZZrmXaaPfLrFCM9Y7/HL0kCJWZQ3Rf9
 JXYRQDr+Q2DpwmHdU6b8xW5xvLgOM4tNt/qsGjrmJiyrCtTSaHDHJ9RH7W5Fti0Fp7Ry
 2xGGWTwjlHVBEmuaT5Xsf1G7Nq6K42bpRUH+YoiCdEoFfoU29KdMivW3Lp4ZLE5xdoU4
 +c6fbz6277AziY+pCzceemrbD0pNPNon8slOI2zidSmUEszjcuYkvxu/kQSnN7P5EAyJ
 nnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27pChsRdCUQ59trojZLqLkVyYJb54ESW4YUjA/ZBzpI=;
 b=bfHlYh1N5l79irRMAv8F5/Wo6M4K+fhEQh3ktATd9XWYrm4uEoTXhk1VSn+UFKEzY7
 j55Gpfq9I5wZSlxgRyZe6vTAvDKNp4Z98c/7Jvys6gfyom4IPjt0DlXdBGdZfIDRg6Tl
 PIDAKYHzs62PFMK733WtUK3qbQrHaYHwXmbQnDFIsJ44VLENWa39BVFy7Wt10yox1TmT
 AXtgrVjPUD9GCAUUTSDOwqaUc6hGyzWSVU8wS4/MfssX5Eu5LMlwiqNoZx7HF7tZvcb0
 TBWY6YEo4Z7mzhzdbk/iHkSWYNwcw77r3OXFBodOSGe1JhZ4Ihpuy0/fdIkojez6F9IN
 2BaQ==
X-Gm-Message-State: AOAM533u1Oa8xCNYG0GvsOgco67XwK2zhO/jPir9GU5EiE/lNfVojE9Y
 F2YF6Cvt7kq2XWs7xN/Ps+of6dwAIVcWQ3MZzdbsYtQ09TK33w==
X-Google-Smtp-Source: ABdhPJyQtEdzRFaP+1Dw1q3lLkIvFh8VzIdTwYKoyoFDcgu4Rs+Vh3VhT/OlnA2DVWTCfA7TRx0VtvpVPeJohbBCOFc=
X-Received: by 2002:a17:906:ad1:: with SMTP id
 z17mr13209416ejf.150.1622283801432; 
 Sat, 29 May 2021 03:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <20210529195550.3dc109c0@martins.ozlabs.org>
In-Reply-To: <20210529195550.3dc109c0@martins.ozlabs.org>
Date: Sat, 29 May 2021 06:23:10 -0400
Message-ID: <CAB5c7xrQu3qTxP3pmaBt2ZqrFABDTovESBA3j6WVaHp7H4Htrw@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Martin Schwenke <martin@meltin.net>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 29, 2021 at 5:55 AM Martin Schwenke <martin@meltin.net> wrote:

> Hi Andrew,
>
> On Thu, 27 May 2021 17:42:20 -0400, Andrew Walker via samba-technical
> <samba-technical@lists.samba.org> wrote:
>
> > I know we've added JSON output to a few of the CLI utils. Over the past
> > year or so I've added this to various utils in FreeNAS (using
> libjansson).
> > Is there an overall strategy for this? I'd be happy to upstream what I
> have.
>
> Sounds good!
>
> > Also is there an effort to add support for JSON input to them?
>
> Your effort appears to be it!  Thanks for that!  :-)
>
> One wishlist item to think about... and my example is for CTDB...  :-)
>
> If adding JSON output and, perhaps, input it would cool to have the
> command-line tools be able to run in a mode where they stay connected
> to the relevant Unix domain socket.  The most useful example would
> allow "ctdb statistics" to be repeatedly run within the one session, so
> a reporting tool can periodically collect the output without the need
> to reconnect.
>
> This could go hand-in-hand with addition of an interactive mode on
> tools that don't have one (e.g. "ctdb").
>
> If this is an interesting idea then I'm happy to try to work on that
> with you in whatever time I have available...
>
> peace & happiness,
> martin
>

Yeah, I have some added for most of the ctdb commands.

truenas# ctdb -j status | jq
{
  "nodemap": {
    "node_count": 2,
    "deleted_node_count": 1,
    "nodes": [
      {
        "pnn": 0,
        "address": "192.168.122.176",
        "flags_str": "OK",
        "flags_raw": 0,
        "partially_online": false,
        "this_node": true
      }
    ]
  },
  "generation": 1598490685,
  "size": 1,
  "vnnmap": [
    {
      "hash": 0,
      "lmaster": 0
    }
  ],
  "recovery_mode_raw": 0,
  "recovery_mode_str": "NORMAL"
}

This one will take a little more time since in the patchset I duplicated
many functions from /lib/audit_logging to separate library
"/lib/json_minimal" to have some minimal set of JSON-related functions to
make bolting-on JSON support somewhat simpler.
