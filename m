Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CD1BD9EE
	for <lists+samba-technical@lfdr.de>; Wed, 29 Apr 2020 12:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9zY1p79+KuUo6y5u71gbrbNPc9IAbN2Wtllo1rimI+8=; b=mzMfXn5TXc67T7zRQltITm2Il9
	U/rq8CYPguPxr3aszN5qzNP4eBm2HlfCGCOiU/MkpPadMx7NZjCjgTCWucADIRquILMkVwHg4DB1W
	eoNMHo0yeGm3M0+jPbuLvcg+CK7WXYi26fdMMva5qJfwarWet4LYNexAu1xGwql4zbv97dKbgDOht
	ns+BfHB2EaqaBOnBjpbPYXE7FxGuFojmL8mDH4PEGei9uYSUzdl29de/jW5ruMljR2B9+kJLcrS4L
	oXGxTHHmjKhicV1MzN5DqyPFS+AzaxKYB83nRp4MQc+rOCo2LmnCDlbyLlWOQZ4EIFXSgfc1RtP5/
	pD9Z6mmA==;
Received: from localhost ([::1]:28712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTkB6-002W0t-Qi; Wed, 29 Apr 2020 10:42:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39654) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTkAs-002W0R-H6; Wed, 29 Apr 2020 10:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=9zY1p79+KuUo6y5u71gbrbNPc9IAbN2Wtllo1rimI+8=; b=2n/6UwOEFsbhtQ8yPhUGOxwwjZ
 pOt18QCRSeQNZ6PSYdrYeZ/kzNlPFfRxTgDCDZI+deQfvHuNfcwlVvyL16j0uqCdC4ZAEZMHpFQYQ
 1+fKDbDzLvK4ZK4G3coH9WjWBySam2lRHUUQrj+w6pgSod25Bb+Meq5EmWXq1NG6dTFACJxysw65C
 GVA07EDW0nod2sOuqaLyD41N+SG2qH8ffAFujajAA17Ps8Qw292DNFO13w5mKJ71PLmRCO5m/Mfj4
 ahH2sHW0F5/mAECJyr3KGmqeRRN7s553L+TwngHL0kpb0EyQosD+YcG3yuI0+WgPgF5YzqeXWmSaz
 AhVZhYDBkwcgWqGlgK5JoZOm7+v6FUHGeEzBburj2x8CWBqM/py8VgslxzlZaAEZZv5QEV0w0R5IO
 6qEManSbgiQ0nHKqA+4/ds2MV5oadSH8iI7JGLs10r6ouweQOmNaNhB5kO5NyJg0zRHBSFM+DEfDm
 P84bnWO8XOA2Z65NXS/DeGfs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTkAr-00089T-Ua; Wed, 29 Apr 2020 10:42:42 +0000
Subject: Re: samba 4.12.2: WERR_DNS_ERROR_DS_UNAVAILABLE, unable to manage
 samba DNS
To: samba-technical@lists.samba.org
References: <6138360f-64b7-c602-7c5d-72cb0c764014@o-dreyer.de>
Message-ID: <b1f9a20b-6f50-00cd-1c4d-d506a0fc083e@samba.org>
Date: Wed, 29 Apr 2020 11:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6138360f-64b7-c602-7c5d-72cb0c764014@o-dreyer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: sambalist <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/04/2020 10:58, Olaf Dreyer via samba-technical wrote:
>
> I run a setup with two Samba DC (currently samba 4.12.2 on debian 10 
> VMs). I started with a Windows 2003 DC but the last Windows DC has 
> been removed a few years ago from this setup.

this is really the wrong list for this, so i have CC'ed the samba 
mailing list, please reply there.

You say you started with Win 2003, but was the domain initially 
provisioned on 2000k ? or does it have the 2000k dns ?

See here:

https://support.microsoft.com/en-gb/help/817470/how-to-reconfigure-an-msdcs-subdomain-to-a-forest-wide-dns-application

Rowland



