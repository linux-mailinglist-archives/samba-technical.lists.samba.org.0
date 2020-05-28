Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D74371E6C55
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 22:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oi7AWB0I0YVBzoLCXoR/XrQhH5Vmr9uzykeiYYKiZ2o=; b=lIKqDJBQR/KsrazQox30AexaW4
	Nz46eVMGgnzZm8Xbh5QNAplq5XR1oMRDPVqm44osc/ei5ljn6QI3X8/VnAe/rir1AiMAIzGe3GRzB
	R1lojse7m/4lTYLw3ZtHRze8+hRRm7v8HRKaKwuF1wy08EVplruhQegbo2P9K+TztJ1zzpgHT71qT
	/wYvCfkfDH1JCBwu6tu8ECq6aDEZXFrDJbNb1qeuI9lBVbOW8wMpLLDx6qTBARcBrac96HW3OYKne
	bYzf/JsteLbLKucKtOQOawswLkR7hlEnza1RRcsbghmgFWAEGAfPG2riCufikuFr+tL9dHMN5+bGk
	XHLVd3cg==;
Received: from localhost ([::1]:28634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeOy3-006Epy-Kx; Thu, 28 May 2020 20:17:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46292) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeOxx-006Epq-SP
 for samba-technical@lists.samba.org; Thu, 28 May 2020 20:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oi7AWB0I0YVBzoLCXoR/XrQhH5Vmr9uzykeiYYKiZ2o=; b=yks7/q+5B2/UE964g9RebGjiyM
 hvlxzMPMaCXpI6HjiHVv+kAcSSzGe+9JgvRd2JAajue701sMS2I/gHIP3agzRUXWcJMzle6j0qhOh
 jeZ3RCRaPwmcEa0Es3s42tHuaEaRYPc+2K2xL3kGZVlLYZtTtwsl1xXRm2gsAiXvLJS+7AmoeqoI3
 yLMD57WeTvDQwQYNmflVMiCuRrMoP6yAfjbvwHKHOvglXIOsYVBIF1Ajz7MWqFQfcN1ywqvPkJuDJ
 eam35CPFKsVp67THNUk83GFxhHv67TPN3VkiMeuT72pElF5dPRgRzXxgAWF5WI/pgcBVdPZm2URg3
 Q6noPWQIMgXa51WDaKYOfbe4kECfIbjPNI2tsi9DrYY56d4saULuu2kp1Iggw7Mj7z2iwV1j5qLh3
 qMWCJA8zxDNd7VCrXRMczBCGvRbd6vZU9HRkBoki7vcZqlSr6RY+gAvZqIQHIElaDY1J5qy7zEX6W
 SfXIpIJLM2zaRk7ELY+QCvKx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeOxx-0006OO-AB; Thu, 28 May 2020 20:17:25 +0000
Date: Thu, 28 May 2020 13:17:19 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: Checking if Samba is running as an AD DC
Message-ID: <20200528201719.GI14337@jeremy-acer>
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 28, 2020 at 11:00:33PM +0300, hezekiah maina via samba-technical wrote:
> Hello everyone,
> 
> I want to first express my gratitude to the entire Samba community.
> You have been kind and very responsive whenever I ask for help or advice.
> Thank you.
> 
> How else should I check that Samba is running as an AD DC apart from
> looking at the smb.conf file?
> Is there a process that gives me this kind of information?

You can always try to see if anything is listening
on CLDAP port 389 (udp). If there's a cldap server
listening it's a good chance you're running an AD-DC !

