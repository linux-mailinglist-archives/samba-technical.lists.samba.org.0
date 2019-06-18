Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080C4ADAA
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 00:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1RUoEka4NH8BakIfREmQyZzJ81riD32E6DMrOYaCkO0=; b=ENWhLy5osI0y5F5dbb0Sow9tVH
	lUYtpRLEHdPIC9NGe66LBqobwxU+5qhI2NLEWZgpkSjBYbz6O/bwgLjZYw9P1iei8z1sX50HSkp5N
	b01Dmy06rGzVc9l7UKVj1wqfrHB/73V49/qxBSfcoa7yiAyTYL5EgWskuQf6MmfUKleau7hlvud8o
	j8IPjKjvNAx6a+xphKGPUIS/pD3s3QSe007xufp/BaS6fKj/nC2EeTxvynCTMQApqQ/nlPLnG75uo
	oyYEWSblLYEWKlcy0UX0uabmQ5LjxO9gQzLtvPPc4PqD8GgsEM7VuL6i3lRz8oPy9lVdjx1lr2UrB
	aMrQwMxw==;
Received: from localhost ([::1]:33850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdMIp-000B5T-K5; Tue, 18 Jun 2019 22:10:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21990) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdMIl-000B5M-Ck
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 22:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=1RUoEka4NH8BakIfREmQyZzJ81riD32E6DMrOYaCkO0=; b=W+QXyU4tG471CP7RnBgHGTe44l
 rDnGsMUb+2YsaT/L/Ei3IxqyZIWQYDEehqnXf3Feaj/E6GdKWQ2vkfNCXLvx8lym6b93dYq77BkMu
 ymb+83fnIyF3rpDQpxgVAKM47DY1MjDxYm5klSsCeb98KQMXIQoDrxXTGUEeZf5X3zx0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdMIk-0007qS-Oo; Tue, 18 Jun 2019 22:10:02 +0000
Date: Wed, 19 Jun 2019 00:10:01 +0200
To: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Subject: Re: RFC: deprecate allocation roundup size
Message-ID: <20190619001001.64cd926e@samba.org>
In-Reply-To: <20190618185613.GA20367@samba.org>
References: <20190618144358.GA6800@sernet.de>
 <20190618185613.GA20367@samba.org>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 18 Jun 2019 11:56:13 -0700, Christof Schmitt via samba-technical wrote:

> +1
> 
> I ran into the same problem. As this seems to be not necessary any more,
> deprecating it and removing it later seems sensible.

+1 from me too.

> Why are you proposing setting the default to 4k? We could just flag the
> parameter as deprecated and change the default to 0 and then remove it
> in a later release.

Agreed, leaving allocation sizes up to the client and underlying share
FS would make sense, unless there's a protocol detail which requires
rounding.

Cheers, David

