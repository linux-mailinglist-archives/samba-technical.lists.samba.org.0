Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA17185B0A
	for <lists+samba-technical@lfdr.de>; Sun, 15 Mar 2020 08:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=luVUI3npsXtWATXdKJnoIn8A+HJirlGy92/EEgcMAZo=; b=5+sPqGWmKSSe+sIg95JSYIymIx
	1jsRlgUSdoZMak4MqNbvnKCF1BRZ0Tv9ch3YlYbfEcQ7BZKWxdhldWeN583//T8wC+v67vZYH/0S9
	cM5Be9atcV7QkckfkV7BKpoexyPzd/DQEHWEhC4fmKsJJZkXb668bypUO9MdD/nKkfP9hOlRnVhlP
	Voi32QtRIKX0XSptI0X+UP8BbLGZ2P02IfiTradmC1z8/Xy2d01kZB7seCW6ecCTCnXuxOoXR3Qa+
	3zsiTm0RwXFvGfZpDTey6Q4XzMtme/o774k91hj9ze0IZ/6ctUYcKYFkrdrsDJOz/HPqGHVn3IQyr
	bPZI7Gww==;
Received: from ip6-localhost ([::1]:28820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDNnQ-00GAdz-Pz; Sun, 15 Mar 2020 07:34:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDNnK-00GAds-AF
 for samba-technical@lists.samba.org; Sun, 15 Mar 2020 07:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=luVUI3npsXtWATXdKJnoIn8A+HJirlGy92/EEgcMAZo=; b=3mNUF0eFuklJa8tiKg2Gibd3P8
 yq6BCFkkfamg6A3696ShqfDxuJxFnS/LmVdSz8xwZ2ILSMGKInD4u+bJCDLknnW4DaWcFdHW2Xd+V
 mWRxe/lEoGNf8XgG4OVZgNLYT8edS6aZkOD+AXNXO3zws/wQYRmhl4m1H18vkaY2zTfZzCWPwEyAE
 zWiNvk1x96nY6awCioPZak5VQp/CdkON/2HZuSrj87WDD1RZ47TvreFGov4OUCdkW7eCcHUJHhsbt
 mEF2th4I62MyUXTJ5mNQ+dSzRnblZ6TZ0yo81vpHztY6cRIA8/wnHbzbb6PRpq0+von4WOlXtVexe
 +ufcUj+d2piuOT6Fgnib8uVSo9s+bt2WwecmTFpi5N51NlUe1OgNf4jjaFRzANwHEt/np0C1Bw8rk
 7jOH5V360rbjmhTHAGNpQGSVtkYMFlriDm+qlqNUpTUJxTTL+0lo9sdCFClxcO+o63vkaFO3J28JI
 cFdV0iA3apdwUcN6yC/mqMiK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDNnG-0006by-SQ; Sun, 15 Mar 2020 07:34:43 +0000
Message-ID: <f07b680930f950b4ad932666f663a9ed527dc198.camel@samba.org>
Subject: Re: bug 9612 fix
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, 
 =?UTF-8?Q?=D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9_?=
 =?UTF-8?Q?=D0=9A=D0=BE=D1=80=D1=87=D0=B0=D0=BA?=
 <skorchak@astralinux.ru>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Sun, 15 Mar 2020 20:34:34 +1300
In-Reply-To: <890d064e-9f34-91b0-6186-3b9925719abd@catalyst.net.nz>
References: <ximss-1128743@fe1.astralinux.ru>
 <890d064e-9f34-91b0-6186-3b9925719abd@catalyst.net.nz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

G'Day Sergey,

Recently another user asked about our smart card login feature, it
would be awesome if you could do as Douglas requests so we can progress
this.

Did you ever submit this upstream?  If so, can you point me to the pull
request so I can look into it?

Thanks!

Andrew Bartlett

On Fri, 2019-06-28 at 09:57 +1200, Douglas Bagnall via samba-technical
wrote:
> Hi Sergey,
> 
> On 27/06/19 11:03 PM, Сергей Корчак via samba-technical wrote:
> > Hello!
> > My name Sergey Korchak, and i work in AstraLinux company. see
> > http://astralinux.ru
> > 
> > I have fixed bug 9612
> > https://bugzilla.samba.org/show_bug.cgi?id=9612
> > 
> > According to GNU GPL we wish to publish our patch.
> 
> Thanks for your work on Samba!
> 
> There are a few more steps to get through, not all of which will be
> easy for this patch, for unfortunate non-technical reasons.
> 
> Firstly, and this is the tricky one, as mentioned in
> https://bugzilla.samba.org/show_bug.cgi?id=9612#c5, our Heimdal is
> horribly entangled with upstream Heimdal, so we really want to get
> patches via upstream.
> 
> Secondly, I anticipate there might be stylistic issues with the patch,
> though it isn't for me to say, since we're delegating review to
> upstream Heimdal. Nevertheless, I wouldn't recommend doing this:
> 
> > +// Begin of AstraLinux patch by Sergey Korchak
> > +// End of AstraLinux patch by Sergey Korchak
> 
> People will use `git blame` to find that out when they need to.
> 
> Thirdly, if you are wanting to contribute to Samba directly, could you
> please send in a Developer's Certificate of Origin as described at
> https://www.samba.org/samba/devel/copyright-policy.html.
> 
> Thanks
> 
> Douglas
> 
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



