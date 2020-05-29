Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8F1E75FA
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 08:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=m7ENJY43irfidPmbhPwCwgEows23r99iwhzjUdEuszc=; b=PQLbvDBmmvfzdNC6ygX+Syi5kV
	Z4onT4gdko0llOuXcZwg3KwiWEWUXvMwGLB2505aHUUESYxlIw6ztCpZJIhnOU3l/pT+PEJOl3GBl
	6+Pig9rgx8HAfNOmo5eO+OlTr9WUIGqpt4EahqYvE7sUMwcFnwKi+pskjB8ueOZQlGpYmxhbzNZHt
	jzPeM6i5orcWhRq6YAKyjwzqLeiOtUF19WEYBB/QDEsMnTtoi3IipjzDMB4JXZYlopUVxhuO/xm5T
	sS1XGm7wZxcyIMBxbRESr6cCt19ww5AmMOZ7NuOtXeBceU+X8S/kSokQWJ+ki783SRjew9ARAAf3u
	uAud6lXw==;
Received: from localhost ([::1]:54574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeYau-006J9b-TR; Fri, 29 May 2020 06:34:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYab-006J9T-3x
 for samba-technical@lists.samba.org; Fri, 29 May 2020 06:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=m7ENJY43irfidPmbhPwCwgEows23r99iwhzjUdEuszc=; b=md8wbs+3jkC4KA3iKTIQXP98/r
 bjfTQXc5hLZvf82YKCzq9Mj1Avf75cL/mZ6PYY/m+AExspJhgA+WAluYSpOJ/XqIguz5+vKplyeA/
 d0MnI5kW1/guxVnfHz4e2vj2tv9y2YxaKk8eKTdjZNYuV5yesNd9hmtaaVnr5cuYvwedDvW3EekSA
 ifF6d9nmtioKYMUQJveDTGohdVgGsnmFx9ualO51nrhQJL446n6jPMQS/Pi+oDfu3RcdSkKxhB+Hr
 hZVqilbOxj00/F1gbhMp0ct54lpUih3Hwaeu4W1TKa0vrr4VMh4MArF6Tcz0Of+mpOTR0sYmDMpvi
 3tScgUHV8oA0aaC0io69hTtgX+snBjUYU0r6DH7B7Yy/pSPY1AZsyaikS50ULLK0/gS9110KKxziL
 WhmJNH8NHyNi0dGlgfuMrI8CvBL5UN/iYxeYSFyYiL0h7wCUuF/BoP9OuUPMdeCvOLQX8UzylWTfN
 WVW8iEmimoWyhBoZeTQuWfUR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYaZ-0003a6-6E; Fri, 29 May 2020 06:33:56 +0000
Message-ID: <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
Subject: Re: Checking if Samba is running as an AD DC
To: Alexander Bokovoy <ab@samba.org>, hezekiah maina <hezekiahmaina3@gmail.com>
Date: Fri, 29 May 2020 18:33:50 +1200
In-Reply-To: <20200529062444.GP5779@onega.vda.li>
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
 <20200529062444.GP5779@onega.vda.li>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-05-29 at 09:24 +0300, Alexander Bokovoy via samba-
technical wrote:
> On to, 28 touko 2020, hezekiah maina via samba-technical wrote:
> > Hello everyone,

> > How else should I check that Samba is running as an AD DC apart
> > from
> > looking at the smb.conf file?
> > Is there a process that gives me this kind of information?
> 
> For Cockpit integration you need to use systemd services to check
> whether a service is configured and enabled/started since that
> environment will anyway have systemd configured.
> 
> systemctl is-enabled samba
> systemctl is-active samba
> 
> For the config file checks, you can use 'testparm' utility:
> 
> $ testparm --show-all-parameters -s|grep 'server role'
> server role=P_ENUM,auto|standalone server|standalone|member
> server|member|classic primary domain controller|classic backup domain
> controller|active directory domain controller|domain controller|dc,
> 
> On non-DC system:
> $ testparm --section-name global --parameter-name 'server role' -s
> 2>/dev/null 
> auto
> 
> Checking configuration is needed anyway because you get information
> about the actual server role, not just that a service is running.

G'Day hezekia,

Welcome to the design session for your first bike shed!  ;-) 

Try (eg):
testparm st/ad_dc/etc/smb.conf -s| grep "Server Role"

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




