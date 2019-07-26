Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD075D25
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 04:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RbqdA5GjRyl9TRVxFxHzSWeXeASGMmgqIJJAO1dIyeA=; b=2/8TE2DP1wSo8/tMssWqWU2bFn
	0TZKs+BtjuHvYAcWd49y+u15f93oEHxlOspRQF1dqvpvW7Ieyl/yNCoXgZBfL9Y58N6qE0W3u3hx6
	qJv8ipVBPczgBH5M1mb/dSEQV4CyJruLPSul5OvFjOG/GDj1+S4xPRTcF+UnaoW6QKWZ0Cv201NuI
	daUh82s9t10b7tnWSgbHGerWxtJKX4B6HBnTziosYV93TLBwG3dK0GB91SNgXm3y2983P1YcAXH8i
	VfijvLHdLTc9OHeLWWWto98bqPC+TMfKkwPTwJ0z5HANVXyHDVyWmp1tO/U8sKio+yGGCPGuWG8Rh
	5viuhUCQ==;
Received: from localhost ([::1]:50638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqqFL-000PDC-MB; Fri, 26 Jul 2019 02:46:15 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39231 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqqFH-000PD5-Ah
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 02:46:14 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45vtkK00QYz9s4Y;
 Fri, 26 Jul 2019 12:46:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1564109161; bh=BtFZd12cjOzLptRdLvMKcOuGPVe89fjInw1rK3Yj2Rc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GtLoC9HMGqL6tuSO+ux2EfrkBKWF3vzD53XtBAgSZlFcaVUvE1D/I7Ju0IK+9eP7b
 eSoY/p5emXOXN54Oi/T0ZaxzGC6kDa/LniTjscmnxDeW5zhk7eNlZX2UfaTAw1wMkJ
 NawWMGHaRCPN/VkiC3SO36CyUT+iU/wGRlRdeXKKo4mGViOyrPC3rFGHfYTzQ144K+
 6OjvKacfZ2rH8jS4lMe9gCGo/YjNKZCmqc37e4xKM6nWzma4fMhP0qtGLUbFdAGPCE
 YRKx7copM1G/mOBinRkVYmt1kacIt7P6WnAnzVkA4k56zSOTx+71rM8Po15G10z81K
 IyMjCCvP6m98Q==
Date: Fri, 26 Jul 2019 12:46:00 +1000
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] Minor fix to conf handling of empty values
Message-ID: <20190726124600.044d2c50@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mQzPtsL-YiS1J=MN3fh2z6D=nWGncnrn7Jn-MfNkJgTFw@mail.gmail.com>
References: <CAJ+X7mQzPtsL-YiS1J=MN3fh2z6D=nWGncnrn7Jn-MfNkJgTFw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 26 Jul 2019 12:26:38 +1000, Amitay Isaacs via samba-technical
<samba-technical@lists.samba.org> wrote:

> In tini, allow_empty_value=false causes the parser to ignore the lines
> without '=' sign, but lines with nothing after '=' sign are allowed and
> cause empty string ("") to be passed as a value.
> 
> This is counter-intuitive, so conf requires special handling for empty
> values (which are treated as invalid).
> 
> Please review and push.

Reviewed-by: Martin Schwenke <martin@meltin.net>

peace & happiness,
martin

