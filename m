Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCE8CF04
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 11:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6JCJcI6oXWKusbenWkvmt007x8+oqSZi3P2ZumFAuIg=; b=eF03m8B2EY5P84DUbIOCAO1E9M
	Xo4BJ9YjYNdkkV5n4ScDeNW1IZgOFN4xzqk7g0i59JL6eI2+3Hpvt9riZB7nfNd7RihRbp0ReCMqO
	aR27TMeP7jzCLJ6zLe6BZssKcZ5wCPE0+mcBswcXVmicuIg507v/LytXAeRk+tRE55anIKpCEarv+
	qpCIt6flxFwZ0rSIwzWRVRdR2id0thzmynqNTxBwoxFvqt5F5Nea0jFzYmUYUPfFdjxco24VHqXTh
	0r7ml7PchukDi/75d8ugR+t/vOhWKKWj1w59rzJ+hwxEFxhpHBs7Njgt82hruepRtxMeNy3dA9t4Y
	/qOxRWCg==;
Received: from localhost ([::1]:46414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxpEv-006Faa-Nn; Wed, 14 Aug 2019 09:06:41 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxpEq-006FaO-OZ
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 09:06:39 +0000
Received: by mail-oi1-x241.google.com with SMTP id m206so71880285oib.12
 for <samba-technical@lists.samba.org>; Wed, 14 Aug 2019 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6JCJcI6oXWKusbenWkvmt007x8+oqSZi3P2ZumFAuIg=;
 b=qi1cRd/98DEMdjfdEE92Ne50AdpE0Nvy6DTzT9HxrITZJn/AbDipJNLzagU+RcCdf+
 94wQsKbDYH8/jAMHGc3pyBb7ubTalCa6hPiRA8nsW7YEeE/PpW6QLuz8O0BaHHcWvv17
 zWFTnNftEuyHxZM46AiPXmHXzNOeqGR+2IBN0U1vbCFEI0QJhBXI0cfbT4g+NugEw/Am
 jbqKFaKDWxY+zQQIrMramEAYfywoHJjJDaREwjyX4YJWZNvTcv4cVJA8C6Eps5LSQpO8
 17rqxTGM0zesa2tUhhMo1FPKK+nHiIby6tJZfdiRpNUSs2tdEj98K4A6c94tI8JL/kzq
 b/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JCJcI6oXWKusbenWkvmt007x8+oqSZi3P2ZumFAuIg=;
 b=bniBcbPR3S/LFbrC+F64VoWO1uDtiyCW5MFjQ+AZzqZaLDJxpyh3yDj6PH0RudnCOE
 h48Uj5gmigbOKcS9yraPIo35PLq1P1OUkyuF4th+gKj22jLEnIyCSRG3dYqKxUI+Pzne
 oWd1VWqBDpMQTkAsrpgHUWNqUZeHDQX6aVk8eQ6BV8UPhm+kmum/ju7M/+8wW7QzRRvr
 CE23Fk0SgMbdDJW4aPY9bYkE4913+UzJ/Kc7841MR1uflv8zAydmimJ/80WiWouKIrQn
 N4d6pTHc04fAymXa43ePRVXjIuum0j5g25cabmQe8exCS73TZ5AsJrwxKqRKv3+s2Axf
 HTXg==
X-Gm-Message-State: APjAAAXbR3zQa2TOsenjnWslhvp+lO4m83PtllxHNf3zD+Ujk9ovTImB
 D0/USozqrCbt29bkMQB4ano8evsRQrDM9C91raY=
X-Google-Smtp-Source: APXvYqzpeHb/dvOdlou4LLU39gUuZajGo1iqHdXeMM7ukKvDjix0NJlcb36zGdzczFnVq1PH9d16avrQvAR0SV6C6+0=
X-Received: by 2002:aca:1c11:: with SMTP id c17mr3761631oic.31.1565773594017; 
 Wed, 14 Aug 2019 02:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190814135844.3d7e556d@martins.ozlabs.org>
In-Reply-To: <20190814135844.3d7e556d@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 19:06:22 +1000
Message-ID: <CAJ+X7mRT1pwwu+iJQ-pqxVx8RibgB7RwFHnVV7qMg9QNX75WWg@mail.gmail.com>
Subject: Re: [PATCH] run_tests.sh improvements and other test clean-ups
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 1:59 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Highlights:
>
> * Cleans up ctdb/tests/run_tests.sh and some other test scripts/includes
>
> * Adds a ShellCheck test
>
> * Adds a -I option for run_tests.sh to iterate over the given test(s)
>
> * Drops the summary from run_tests.sh when run with -e
>
>   This is particularly useful in autobuild where the summary makes it
>   take longer to scroll back to see the failure.
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...peace & happiness,
> martin

Pushed to autobuild.

Amitay.

