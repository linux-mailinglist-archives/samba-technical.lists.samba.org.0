Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52C1C52B9
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 12:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AhCu2TS+paJ0yIpMi6rm5w8gKeu4E1V0MXIZCGANACQ=; b=WxqTLFjG0Iai7B4vIzGar7KBIs
	oFiQiFyXuHbXfyz/X5O/1Qj/zZOdB+sadyGyxxDNTXVeehRy24QqgSsHoqLoncumJ1wSkpPEeQ+47
	TcDW63hZ2Lz4CfJaaDuVy6sjQ6SiCbcMH3qOfjLJ2CdJHu95BATH/pzpCqjI/Yw/H+ADc2etq+TsM
	j31B3Xn4mCGUuS6d6UO+NEbqMZpaAtUj3NOUrgcgXavHPwYKi6v3qX9Mxo1TkYL8bhQTsc9wdctCN
	QIwBlZQfaX7Z5vJ+37z9F6vjQZwQX3H/y+0Ij7oOPSl6IkWTztcNrZuNCTVGiku/1Bpv7Otc08tOc
	OBIYi0cw==;
Received: from localhost ([::1]:62906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVuZd-002lfl-U0; Tue, 05 May 2020 10:13:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuZW-002lfe-Bz
 for samba-technical@lists.samba.org; Tue, 05 May 2020 10:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=AhCu2TS+paJ0yIpMi6rm5w8gKeu4E1V0MXIZCGANACQ=; b=pCBCtrIAuoOsei7pYJ5+oOKCem
 S9zyKaoIekrtYswtkW9m3BuJ/5/rG/qV5m7pqeAUlCusSd9rke8KAd/vMCvVRWWA2AuSIpwOVD323
 VbKcyKt6iKWMImL+P8egKS7UiQspj0zZ9HFVfqDmbOAAjxvqI3nRVGJqb60w3fQmqhLVprYGH2jS3
 Lgqz33qf6vVpnygBr0qKB53xDUDME0MlMEdo4Mv0vCCsMoZ4ro3YNZ8XkdpOSZogba+XfFpPuKWVa
 DJOvbhpERQNfAqTFlxtlUwLfRsIwz7xT9qLM1E8gQo5Zx7xCw2YKCVw5fsEBiSLafEkWVhpJDBjFM
 jOcFC1s2ETq0K+6toPPy7/hjE2YfNyG/1fRM3QdZbftrcEUuGTReSgAj3dNujccgMn8xSC4R6PBKD
 lqY0GbYvZqA/PvQX0zYrJTHCg5oACfh+QkQOAGyIEeCN+NAUMlUM7fYFbmdAoSm27uVLJqOCucVUO
 KVx+J2M0oK8ISOGJ9gf75iKz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuZV-0001Ij-5F; Tue, 05 May 2020 10:13:05 +0000
Message-ID: <ed80fe0ce336aec5cf0b9d83fde56931a2f5b292.camel@samba.org>
Subject: Re: [PATCH] Remove 'samba-tool user add'
To: Karolin Seeger <kseeger@samba.org>, samba-technical@lists.samba.org
Date: Tue, 05 May 2020 22:13:01 +1200
In-Reply-To: <a0eaf57c-1731-2a25-82ab-9d76d73b8380@samba.org>
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
 <a0eaf57c-1731-2a25-82ab-9d76d73b8380@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-05-05 at 11:57 +0200, Karolin Seeger via samba-technical
wrote:
> > 
> > What do you think about:
> > 1.) Just replace the "group add" with "group create" (and keep "dns
> > add"
> >      and "spn add"), like in my merge request.
> > 2.) Have both, "add" and "create", for all subcommands.
> > 3.) Roll-back: Remove the "user add" deprecation warning, add the
> > "add"
> >      command to all other categories and deprecate all "create"
> > commands.
> > 
> > Please let me know :-)
> 
> first of all, thanks for taking care! :-)
> 
> I would prefer "2" to make sure that the user interface does not
> change
> (existing scripts...).

Sounds like a plan for me.  I would also suggest 2.5, have both but get
rid of the silly deprecation warning or at least agree it will never be
removed.  We can cope.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




