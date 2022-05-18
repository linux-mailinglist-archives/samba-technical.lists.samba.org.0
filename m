Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4352C112
	for <lists+samba-technical@lfdr.de>; Wed, 18 May 2022 19:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=e3tsanlqjq6P4ju7vK2laCWvzoVRw3fHXtwM24F/q1M=; b=kW33wmA5NBPP9VeN2ej1i8dXlE
	ECkgp9ffj0kfVXSKvNC5KhXXfoE7P2YN0k6X4/W57ExEmsXKVXAllIyvSaT9QY3uSLlQ/UDgKFSXT
	kBJNWDb7Sdp/ZDBtpJWPZjxfu6qEs6QVqDxaJKBjVzj7LVVL+nwJM2KcmR0JRTaQdg0qexRS8nI66
	hls13jz6c8HORTDEfWxpDGeJIw04OX4HwBAQliimosTdbX9CfXYUfRErEcJeXvS6uaoj1VQejkO0v
	DrUHY+yD/W3A6dXpNS7UB8cgvfr+0gGsd5fk0UXmhAoP6MTp24sh0+TfOU+B/3eJIN6aB2BEDMmXb
	2L173aUg==;
Received: from ip6-localhost ([::1]:38210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrNik-001x21-Ve; Wed, 18 May 2022 17:44:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61658) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrNig-001x1s-Jf
 for samba-technical@lists.samba.org; Wed, 18 May 2022 17:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=e3tsanlqjq6P4ju7vK2laCWvzoVRw3fHXtwM24F/q1M=; b=ENidXupu6gY9SOaWfVpTi/nl/V
 6wEl+1GfgKy9cKjt/lc7slRZo2TqwqPNPDOlyEkxUhDoEBRMHrBrFytM8OasKOx2ioT66T71CVO1p
 Z6wMobzNKDyMrSJkXEfO0V7bC6kum/6zGrhk3wYbM4k5SdKTGeWUSXb2ffykPhZKNMMdi/qJiu0RG
 LxYRA+n+LQ75xrvqS22VJj4n46ITT97zL92WfmJRcbZe0w8kJ5WcFY+Gqse/SPGrGB1MN5fz9xOYh
 l4dqkizI4icqeEIowzXaK0LFytfJsMboVPzRXCLrAFMD50HWo6k9YEhFwBZZ2MqtYih/Cm0X8Ap41
 6hfuiwjYisRE3GXYWBYVwU94ZaMSnj8PI3my+3OLXoulMpjxvZiBwPiLgccmEjv/Wq9kMXRO++O+d
 y5EZCYBT+TcuIy24exh8is0LcaypPfH9Jaa903LCofq1UXrs14tS6RZ+QKARnDYlJIRLSyeA3n+og
 yIQzuRnL7dYc1hRSzkdoz+VT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrNig-001WMq-7a
 for samba-technical@lists.samba.org; Wed, 18 May 2022 17:44:22 +0000
Message-ID: <a10954d586be4609ef129d45677dad92d25e2969.camel@samba.org>
Subject: Re: ** server can't find 36.40.168.192.in-addr.arpa: NXDOMAIN
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 18 May 2022 18:44:21 +0100
In-Reply-To: <CAM61p30zXBnE9dTuyUN=dnqJzJh-=+5W_OvH0hTMGJD4K9Gr8A@mail.gmail.com>
References: <CAM61p32DPdUCwLLSXx7Pez_HD8xc7nLQYkVhZFrhNDJ5wT7yBA@mail.gmail.com>
 <68118e13ab297de53be260deeeb3094563ce7f3d.camel@samba.org>
 <CAM61p30zXBnE9dTuyUN=dnqJzJh-=+5W_OvH0hTMGJD4K9Gr8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-05-18 at 23:06 +0530, Prince Chaudhary wrote:
> Hello Rowland,
>  I have this mail id only, can u please share mailing list email id.

You need to go here:

https://lists.samba.org/mailman/listinfo/samba

Register and then post to the samba list.

The samba-technical mailing list is meant for discussion about the
internal code, not about problems you may have.

Rowland
 
> 
> 
> On Wed, May 18, 2022, 12:43 PM Rowland Penny via samba-technical <
> samba-technical@lists.samba.org> wrote:
> > On Tue, 2022-05-17 at 11:55 +0530, Prince Chaudhary via samba-
> > technical 
> > wrote:
> > > Hello Samba Team,
> > > i am getting this error *{** server can't find 36.40.168.192.in-
> > > addr.arpa:
> > > NXDOMAIN} *while i do nslookup to my server ip, this came after i
> > > added
> > > reverse lookup zone and tried to get server name using ip address
> > > although all other tests are successful, could you please guide
> > me if
> > > i am
> > > missing something?
> > 
> > You are asking in the wrong place, trying asking on the 'samba
> > mailing
> > list'
> > 
> > Rowland
> > 
> > 
> > 


