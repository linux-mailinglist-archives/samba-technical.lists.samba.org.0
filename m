Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 691064F87BB
	for <lists+samba-technical@lfdr.de>; Thu,  7 Apr 2022 21:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MDWB3Ym9avW1CU7FNCfdCn5OIis4R/OgQsNiuaGDeL4=; b=IDgt3ZiNb9tdLr+9lD+EByNxlV
	OKWpgShjOzzoLpUb3YF1wK46nCThTr6oGPv6B9/brODv+QJAvds9ZTxpOcrONlgNlIKJH+Y9PLg0D
	GSbNG9uvHeeOYZBldWbrP8ZVDO5m8AKj/Fm2llrcRbLmjXnNy5LkCFpgn+zplZpZwj4sISv5d/5+9
	3WmX5+cQ1bDRR06jsAqonjPp6TIJuXh3Vz0Kt2sZAC8rkzjYMZsKpmSyERu4pN1LdNOlSBXkOMRpy
	PaaTZiWYQFK4AWleZjSA/F85m9HcSAEPP7wP46je1EKTTCcUV8+a/yUJ9wtRukzXZ2rNWFw9vvhsf
	3X7PNuxw==;
Received: from ip6-localhost ([::1]:42928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncXWH-00Ax9q-BW; Thu, 07 Apr 2022 19:10:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncXWC-00Ax9h-Nw
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 19:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MDWB3Ym9avW1CU7FNCfdCn5OIis4R/OgQsNiuaGDeL4=; b=zlm2HYiK2CElv4sFIa0leR9099
 m7qFJMx0Ova5CnJoHG/7sC54AL3WMWr4nZEtoD/r6O4HkmXqXc05QmBUNTp1LmYLXZxB5Q1Apepdp
 Ef/qhBFY4S1jSxHCLzNrocN3hyPEJeYZCQcM7lQD0LSGRotXLG1386GgKp2e145NuUbyg8kXhzp85
 svm4P63M+HEUtnHdJKTj5G/a8O7K0vgq4EcyftRHD2+TEaFDMZjlG5xv+b3fZDd7sQxlf3haEHLL+
 ET3o0Je7q8LR1wYv8MFBWdakbC8eKEZnjcT0IkHIpfhEF/iHDgl+ztTRTvdKvvWmW7ALNB/ciPa4B
 XfY1uTmnIsM8BhyJqpSSGp1ujy+VdpexrfGr9OYF16acgRz3nms8MyEC1IS9Ze+OA9pCo+QNxstLf
 sWN2Bti+5GYfKMLbYAnRyIRMNB+5If5Bz3v29eEQGgTGc4R4NnAAcxu8ACAGg5sGybA7ak87C2fUG
 sydN8Mp1IMl3/EjAZJ600QF5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncXWC-005ts4-Cv
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 19:10:08 +0000
Message-ID: <8f94c719c13226aa2c966f71a7063cb45c11a840.camel@samba.org>
Subject: Re: SMB1 can now be removed from the server code !
To: samba-technical@lists.samba.org
Date: Thu, 07 Apr 2022 20:10:07 +0100
In-Reply-To: <Yk8znpNzRv+gLcHM@jeremy-acer>
References: <Yk8w5TWMP7bKmy0z@jeremy-acer>
 <8f1a87e9-fef6-599a-c0f6-1dc4921e355b@samba.org>
 <0d486c94-2570-c79a-a582-a049d908be50@samba.org>
 <Yk8znpNzRv+gLcHM@jeremy-acer>
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
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2022-04-07 at 11:55 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, Apr 07, 2022 at 12:52:25PM -0600, David Mulder via samba-
> technical wrote:
> > On 4/7/22 12:49 PM, David Mulder via samba-technical wrote:
> > > On 4/7/22 12:43 PM, Jeremy Allison via samba-technical wrote:
> > > > to David Mulder from SuSE for writing this code, and to Samba
> > > > Team members Ralph Boehme from SerNet and Andrew Bartlett from
> > > > Catalyst for reviewing and improving the code changes before
> > > > merge.
> > > > 
> > > 
> > > Jeremy failed to mention that he also played a huge role in both 
> > > writing code and reviewing. Thank you Jeremy!
> > > 
> > 
> > Also, thank you Volker Lendec! He also participated in code review.
> 
> Damn ! I'm sorry Volker, I forgot you also reviewed :-(.
> 
> Volker was the impetus for splitting the patchset up
> into the separate files rather than a grab-bag of
> "smb1.c", so he also deserves *massive* credit in
> this !
> 
> I always forget someone, I'm sorry.
> 
> Jeremy.

Congratulations to all for such great work, looking forward to life
without SMBv1 :-)

Rowland



