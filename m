Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8C37475F
	for <lists+samba-technical@lfdr.de>; Wed,  5 May 2021 20:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+SiaCen3a4DpE8OrgQEDw+DVAe/uAWDg+Jy2HzWIWYE=; b=b+yJqGam5utrgTWPXTPvk4o0V9
	meGU/fXieVHyVA3Zuiwe8tnV+wQbm+IvQWrxA64FoeK/SCx5h9/QN/kEXdLUCaa8CBOddcyVQUfQI
	Xggs2C04ATe0Ch6Lv5M/ha/nEWmKfEj0+ar/TNiPHBsyjPWEZskKnkn7kmO/7kQnSJlt5qc5hA6K/
	8QusyIQX/UC0jeCIAFemsPUUS13IMjb1LNej3uR/XfyHUdEEzGPiLMxMvt7Fd8ueZjUQXZvE/glvC
	bg9z7vmGxCXtoYKbFvFQ5uqi4NfefnrgS61xFOKute+zRYj/so97vJXgqS6vsy4nXcwC6g/lD8Rej
	eF3a6PTA==;
Received: from ip6-localhost ([::1]:31966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leLsg-00FaSF-Ie; Wed, 05 May 2021 18:04:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61514) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leLsW-00FaRh-6j; Wed, 05 May 2021 18:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=+SiaCen3a4DpE8OrgQEDw+DVAe/uAWDg+Jy2HzWIWYE=; b=Vn2MIRj53sEE1Cuta5oNYu1f2+
 4tM5d9auOUQhLP/vqUEd1fvrUWMwlRaGQPIeZfVy42ylDaYWs7d3IHcyAJpQmLOoyubeuLIJRpLi5
 ys0RLam3lJvXN1MkwKtsfYMc/KMpgftimC3X/30ufFKcS3xOUXLqEIW0Hm+ZKQKGEFx3Y+8BG5jqF
 X6wa74b+pKP8XsBObHwLmCzDFvjB8AgkNBhfWU6Fs67akm4XJ0T1eou5S1ZmEimgoj7OL0zsXDZw2
 aaXnl1+HIyb1aKCs7N0aam4iaY+C8JwbQd+RokZN079FWr08OLpxcZdAfDYCHnytscCIK6cQusguT
 hS0hY4diiVnCd/fkOcfKEvAcMk5Uqrn8LqJ5wz7Y0A8cJFEaVr3WBlCVLj1rqw5gVcwAMKhlvHhkk
 uXGcz7dbOZG8IHGiI7sjX4mc/SV5iGsESIjX0Iu3wQ4enrYHVpZlAxTll8F/r4vjg6tpsmnsNVwGl
 OduAhIqXiLQhca5C3LYUGX3f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leLsV-000518-BB; Wed, 05 May 2021 18:04:07 +0000
Date: Wed, 5 May 2021 11:04:03 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: For those of you not at SambaXP..
Message-ID: <20210505180403.GC24227@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You missed Metze from Sernet showing saturation of 100Gig ethernet
interfaces with the new io_uring code on Linux :-).

And David Mulder from SuSE and Igor Chudov from BaseALT
describing all the new Group Policy management updates !

I want this code, and I want it *NOW* :-) :-).

Talks are recorded, so you should be able to watch
them later (to be announced).

