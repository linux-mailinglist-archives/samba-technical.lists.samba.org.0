Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 126773B8CBC
	for <lists+samba-technical@lfdr.de>; Thu,  1 Jul 2021 05:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hGfNrzN7yQGjbRzMRLY8IHVWAz4E3BwXBvZ1belTcwo=; b=j+UqtF1xMDO5Cta0oxBO0ENEQm
	5K59dSyNdCXrpx7cUQ07zYQel/DE21kTGjlg6pYTjOODPTYSkVoJ9v4C3WPQA7ftGh5DHtGFixx7j
	2LRtJtV5nzkfznwehRIRpLaN724lkRrRJGidreFTAKKG2YX5ZG5MUfE6klirPjlNrzKMYjKbNBhGY
	HX6cC4IaBII5NiL6afnltuWg6ZlT5RmALGCwqlQQXgnLuyF/VrhjES66hLqq9jTF2Adf2mHlMcxV/
	WWhejUKNYoUY+uxemf9/KOy/CWdvrwkpWAksFyug9YhEBNzu2s0RRSf7lHa0IlYrdI84urwg90dET
	dZB95whQ==;
Received: from ip6-localhost ([::1]:35112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lyniU-00BO0c-1s; Thu, 01 Jul 2021 03:50:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lyniL-00BO0T-IS
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 03:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hGfNrzN7yQGjbRzMRLY8IHVWAz4E3BwXBvZ1belTcwo=; b=VOnlnB7BbeYjAHUtWvYWtUUEqu
 BWFdbgPOa6Bk6WwtIA3M1zqrOx9TC5oWtw9OifCF8NlTi4ETst4fy911eplmCliDwQy7InhGI2B+J
 FEYIr/cNDLrPFNgG6TYL+LfbwEvmXAzm3z60NLzpV6Px6XINMQrff+aW4yADUAwV3ynHxvYRQgUUi
 PRR4lVkqfJynudTZrTIk1zvIabn2PK66mztf9DwlSiSGVIm9DB8l2ZshXsxnWzc/Jx5VgOerxnJj3
 3gfhYZQ6Qwm+CCTXqUeNH9evloP5AvGTkOhYvobQgUf7kWEbnM177JuWzVEHWYoUA2MqUr+GlRGI6
 sQKFdG31r/fDvbfsNqvU/QwGp6DPzA6gm/6C+RoAUiGrSRbja/vB2hL3Rh/qajzmstVyczWP8VJtJ
 G7m+wWeK12GMNdzdDY9MGM3+Vh+LtyO3nWhEkdpYVsXDleg7mmtnzbvWvyY0iOhMFXZxiKGBAB8/a
 2xmWHFe2skNuYCasmgvXrAbM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lyniJ-0003uQ-Ng; Thu, 01 Jul 2021 03:50:08 +0000
Date: Wed, 30 Jun 2021 20:50:04 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Given PrintNightmare, should spoolss go the way of SMB1: off by
 default?
Message-ID: <20210701035004.GA165140@jeremy-acer>
References: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 01, 2021 at 01:56:05PM +1200, Andrew Bartlett via samba-technical wrote:
>G'Day all,
>
>It seems the current keep-the-sysadmin-up-at-night is a thing called
>PrintNightmare (CVE-2021-1675):
>
>https://therecord.media/poc-released-for-dangerous-windows-printnightmare-bug/
>
>Hopefully this doesn't read on Samba, nobody really knows the details
>right now, and if you find out please mail the Samba security alias
>with the details of how and we will deal with that confidentially.
>
>But the public question I have is this:  For Samba 4.15, can we set
>'disable spoolss = true' by default please?
>
>I love printing just as much as any other team member (joke!), but we
>have a lot of juicy code in printing that many use cases don't need.
>
>When the next printing exploit comes our way, it would be nice if like
>SMB1, many of our installs have it turned off already.
>
>What do folks think?

+1 on disabling printing by default for the next release.

It's a big chunk of horrid code.

