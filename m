Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81636FC79
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 16:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hvuhAM/bdYZS6GNZq6fLTadEZ7Lmr6CplT/DTB3ifgQ=; b=OSKEjL6MBIB+nXrinbCYwH4k/C
	xjytx0WQUn7pR9gheIZmwxQwL764RFRb3Fwd8zUIY6JHkBZTz2T5T3k/KdvoaRHH5gj2wCmQpC0Hv
	sgrc8C9zKQ3Zg1t3qvQgAEP/8zhkPjIJeh7sYQnqslmf9hU142y9HulpllE0yKI9+J6iVM71wlzty
	w3yJoQZuIcfyOPMjm/a66wQFCkX+9iMA8qv5V5EGv4FUr13fnIUmV9o1nbKE88S0HX0RMnQm5A3Tv
	YQoozmW1HusG/jVBMx37Lbi5es98Y11HanxVccz+tmj1rgZY1hPecF7QnpcmD/xA1NzruOuJH4FOI
	2hFksmZw==;
Received: from ip6-localhost ([::1]:45990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcUAl-00DJRC-9v; Fri, 30 Apr 2021 14:31:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcUAg-00DJR5-L7
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 14:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hvuhAM/bdYZS6GNZq6fLTadEZ7Lmr6CplT/DTB3ifgQ=; b=F9LBZcu7o/qIokbnd3p7Ziwhzb
 6HAlSqKgRhdCf6LJCNkYI0ADRXIGqkbP4zPp0ocnBow2DTobfJkRRSA95Ci94Aal7WMk8T7AyyE4Q
 pv62GNJYfaWWJBcDysh+xqjUsX+CcDLOO/7y40BK0IXBmuW3WxnfBBcwGO/iEV6C39blmTlizbJ0z
 sTFrlhsJiNmKEI2QTunsG3ae+KK2rYY2UUlm9hSeHl5kqiElEDEojwRues1rYbK2Yh2N46UnrU3VH
 7lXpTI8Y/RDP+i9/4bWQIuEj5zA0VO6yeYVRyr5kRIPTaBJayf7fuGBMS+GndhrgO4aOSm3+opEcQ
 Oc1+YwB086xncA5ywUYC/IfV0/3+aqRZMCB+pf7epyfdP5PkZV3wynpeoCQOiKGohqIMEZwrU5AWk
 h5KJsjaYnKqxeZYNpMPvlGFfQWDpNhDhg3VZ4FWkgmxu6VE7Bi5hWjHMJmJYu86yEE/jkQI19LUR6
 A4sOqEZCJd+AE0BHKrxnF/hk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcUAd-0002Fz-UW; Fri, 30 Apr 2021 14:31:07 +0000
To: samba-technical@lists.samba.org
Subject: Re: Fallback to NTLMSSP allowed if KDC is not reachable?
Date: Fri, 30 Apr 2021 16:31:06 +0200
Message-ID: <7127506.Ry5G1WW9Aa@magrathea>
In-Reply-To: <CAHbM3qgUBhz0_UqVVHkAU3Q7RnmktCMK1WhW-qJo0fahoL40dg@mail.gmail.com>
References: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
 <17822891.NNXsROtQf7@magrathea>
 <CAHbM3qgUBhz0_UqVVHkAU3Q7RnmktCMK1WhW-qJo0fahoL40dg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 30 April 2021 12:42:31 CEST Shilpa K via samba-technical wrote:
> Hi Andreas,
> 
> Thanks for the response. I was using --user along with -k and provided the
> password at the prompt. libnet_join_connect_dc_ipc() has fallback after
> kerberos, but not ads_sasl_spnego_bind(). In the
> routine ads_sasl_spnego_bind() which is called as part of domain join,
> there is this check:
> 
>                 /* only fallback to NTLMSSP if allowed */
>                 if (ADS_ERR_OK(status) ||
>                     !(ads->auth.flags & ADS_AUTH_ALLOW_NTLMSSP)) {
>                         goto done;
>                 }
> 
> It is checking only for the flag and not the password to fallback to
> NTLMSSP. Is this expected?

I would suggest to open a bug report. We could look into a fix, once the 
cmdline improvements are merged.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



