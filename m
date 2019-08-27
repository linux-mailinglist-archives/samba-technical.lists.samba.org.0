Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D396F9F709
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 01:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3LuUGGtEokBNpfQAeegwxURTy+FRvCVO30TCRCEuxbg=; b=sNApVnF4X21hrGiCMq2FJmCM0W
	oqEY7Ktdab4z8sVa2yTOkHo6wk7WQpkB1c0eHM8no6p6QFDKgWA0Z29Za4ngI2+c0fH0/jKuGgLg2
	H1zu0TdGAeS2w7aOETdQdpZAakmRI7PEarHoKAs4jiPkal5/fm5/uRSK78OOsL/u8xjmzZ7gMutWM
	pO9Z75YTARcGBTQNYzIpcXiKmbC3aZ5HpcCzfQziUjB1svSmpY1oQa29TCn275F+KKVQ1g3PV3+yC
	jwjCYCUF2uw2wqIaKMRYZkj/P9hU8I2cuK3EULsM3HH2Wu0gRZTRinslTcEJ85FycQinvH4JW6UJD
	39Emx8cQ==;
Received: from localhost ([::1]:44998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2lBr-008q8g-9D; Tue, 27 Aug 2019 23:47:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2lBm-008q8Y-T3
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 23:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=3LuUGGtEokBNpfQAeegwxURTy+FRvCVO30TCRCEuxbg=; b=IPDuJkQ8kx38pASa1xMOUYHXtz
 hCTGZw856B7lbrJJeoEV9U2RtbKuRn2hQASsNUFKsXZf9/sFek9sZyoIWwlO44XLjYeeVZFfhB2cM
 yAq1cJi5iGVJlrlAZ5jH6JFvYJW1963d6Te+52El0Vz7akhBtMHMHD50t7RXMuVOXa74=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2lBj-0007U0-DC; Tue, 27 Aug 2019 23:47:47 +0000
Date: Tue, 27 Aug 2019 16:47:44 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: smbclient having problems connecting to a NetApp C-Mode system
 with kerberos
Message-ID: <20190827234744.GA219881@jra4>
References: <CACyXjPxjPoewRRghAem6ZKX7VSihjno5OoO_BNV3GnOBiSJDyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPxjPoewRRghAem6ZKX7VSihjno5OoO_BNV3GnOBiSJDyg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 22, 2019 at 08:51:59AM -0700, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> If I try to use Kerberos with a NetApp C-Mode system (simulator) after
> doing a kinit, I get the following error:
> 
> "gse_get_client_auth_token: gss_init_sec_context failed with
> [Unspecified GSS failure.  Minor code may provide more information:
> Message stream modified](2529638953)"
> 
> The only thing I can find that might be related is a suggestion to
> switch off AES.
> 
> Has anyone seen this problem?

Seen it reported via Googling (on other apps). What does
wireshark say when you look at the stream ? Debug level
10 ?

