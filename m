Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320524A8E9
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 00:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=YOEdDQ2W23OpXCmtYwq/oy1qj3ZO36ROgS9VsZ2gWdI=; b=m/8T6mWZg9qTYP57HIzcDt4kaT
	FvLkyOgga40NTLyGnmU67CWNULOfC36M9Wnqt/ZdTJIalToREHeq113iTpWlWsJ+m5zy+K7+hdGXc
	rEWD86x59tKHtIvaCwdlO++FA0Um5WNnJERPJxptAjvBjU43/2TiaGC3iQXNaJuisKQiulc9lVm5q
	Aws+TyTUmJeiMzqH1aTwcTEgtgeFddnJsPfcPn3vGhyrJ+XXpANgK+hZ3yJyjfPVEob+A77MbS2Gy
	UetYeCug82LaB6VW/WthQHSu60IAZxzmEnvbcIZQkKlcDVEuYf7mt+BOKimgGOs9icAfKDjCpFchk
	hRw5O/Eg==;
Received: from localhost ([::1]:54092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8WIS-00EM26-9W; Wed, 19 Aug 2020 22:11:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8WIL-00EM1z-Q9
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 22:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=YOEdDQ2W23OpXCmtYwq/oy1qj3ZO36ROgS9VsZ2gWdI=; b=akTILbuT7aEAfSA5bGZE1XO4/4
 db/Hm22UAOoroIZ8k0x+ERtWPvDNpwzQ6GbIuf97GqUrHkZTJIipRfwrdcUWmiV+WZWDxKzZ1JloQ
 xcUZM5QKIkJg5BxTobZFRJWTadVtCmEE2wa1ba6NqcWfpFp/chlhFGMAl3/YGN7/5Ye9mwzl5UxFW
 w99QSncb9glRDfXnAl3lD803cXrUd4Zdd3AVA8Nuyhw/eufornTTeu3Mjlya3ssfqEKp11oyTDKvu
 g6iWZyDdhkAyosd2nWvGarIxDhngJJyqbzF/7eJigTgGaUdCL9+jbqboKa6MCjk8IsKEIRSD7B09w
 VY84UlFjUgrC8CYbiRER3V7cDwyRu+4jVqy4ZGEQs6jAVzdwqcZz78ByOzuPRwlt89kLJCHcySWYh
 eZa3ivbDwGIsBw5wsVz63x+GnwJd1jWWB1HSOGIORCLbbaCGavp+AwBb+pFYF5+NdmsNKGYL6NpYr
 LKgDKXHoMMdWMBBLBwKyVW3A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8WIK-0005d2-5l; Wed, 19 Aug 2020 22:10:57 +0000
Message-ID: <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
Subject: "auto" for Kerberos, a history (was: Re: WIP: Samba's client
 command line UI)
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Thu, 20 Aug 2020 10:10:52 +1200
In-Reply-To: <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
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

On Wed, 2020-08-19 at 22:13 +0100, Rowland penny via samba-technical
wrote:
>      -k KERBEROS, --kerberos=KERBEROS
>                          Use Kerberos
> 
> If you check the code, 'KERBEROS' is actually 'yes', 'auto' or 'no'
> 
> What is 'auto' in this context ? surely using kerberos is binary,
> you 
> either want to use it, or you don't, 'yes' or 'no', so what does
> 'auto' 
> actually mean and do ?
> 
> Do we really need 'auto', can we not decide what the parameter
> defaults 
> (for instance) should be and remove 'auto' ?

In this context, the current code behaviour is to try and obtain a
kerberos ticket, but to fall back to NTLM as 'good enough protection'
if this fails, for example if no KDC can be reached, or this is an IP
address, or if the server does not offer Kerberos as an authentication
type.

The idea (when this was written) was to at least try Kerberos, rather
than continuing to default to NTLM only.  (And on the flip side, to
continue to work in the many - at the time - networks where AD was
functioning only with NTLM).

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




