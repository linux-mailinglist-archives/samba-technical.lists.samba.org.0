Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F01DBE24
	for <lists+samba-technical@lfdr.de>; Wed, 20 May 2020 21:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6mvwbfIRbWwTfR39+VGV/dpOuTIuEB6i87HZ/EewISM=; b=nSzuH4e+xBbM/YDiYLXNPy7T2v
	fZy8CfxOGFW/a6Arpwr7BAb5AgBTJ6LwB9fFXHFhgpgm2jCyn685VKgjAtwZCNsjShBtFqTjZpYG9
	TkwdV+RgoIcZa7/4r0Fdsud9DspPEhMhmhG/fG1IYXntFJzm4oqxYCpGc791rhULcR7wv8+3dyUbT
	GBdpgCQBaAESMfiHAp2Qdr2wH0MISXLqb+6mACaahimhUDWjZXOp/Xhco9pC8YCzdJdr4b2RZajad
	H1jABZCF7y9dq0YghWjJTR+RfMzlZSP4CKu3Ib4ixZsCcnRdjbwhwPPlQH1NTALOMscBIWzHb4E9i
	lgGJDd7Q==;
Received: from localhost ([::1]:54468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbUZV-005I3C-UJ; Wed, 20 May 2020 19:40:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbUZR-005I2N-2s
 for samba-technical@lists.samba.org; Wed, 20 May 2020 19:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=6mvwbfIRbWwTfR39+VGV/dpOuTIuEB6i87HZ/EewISM=; b=brR9IWoc3/TTyAmy9ucynUAbnV
 8P3vwlVuLihaF0HXLM0XUoqY0nWEnQQD2b7BcLMX8/AXgxQ+WAY9ZjWkQIHVZKGpPSIJLLC2rYaOS
 DhEPMxXtPSU+Vao39TMxk7RMBKLU8qEtDpy6TmOf8VaWSGvXfJk+bYz73ep83h1l5Bhz9v8gKqrnI
 4JGUc+lu+5/eTL/1o7EczyX2jJVw0pgyxPYe6FTmlQQuCeDMdNPIBnhx2/ISebaQcS96wKLXZkcBd
 iURtALdymp+dWZSONCcA6KGovAtjgEQGWYhnTtvgPSW8qwpDVZ7KlfG8wMgeekH3Q2LMWF5mXCztP
 9B2IS0roI0/KSIMenuQJ22glZVlCvWcfqIym68DfPDovBZRWuuZUIxwIAFSFvOmYgMJp+LDIeBeGU
 rOkqpsFRqRfO/fOHnc3vuHsLNO5OMK8RWXxOJ8x/oWQ0QFTIiHdyOH992Qrqg4X17KVWoZa+dYXTc
 xX5nWm6iAlZcohRrFRMYQDe/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbUZQ-0004KI-7W; Wed, 20 May 2020 19:40:04 +0000
Date: Wed, 20 May 2020 12:39:58 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>, samba-technical@lists.samba.org
Subject: Re: Why use TDB and LMDB?
Message-ID: <20200520193958.GF27061@jeremy-acer>
References: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
 <20200520193237.GD27061@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520193237.GD27061@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 20, 2020 at 12:32:37PM -0700, Jeremy Allison via samba-technical wrote:
> On Wed, May 20, 2020 at 09:46:02PM +0300, hezekiah maina via samba-technical wrote:
> > Hi everyone,
> > 
> > I'm still learning Samba and one of the question I haven't figured out yet
> > is why
> > Samba uses TDB or LMDB instead of RDBMS like Postgres or MySQL?
> 
> RDBMS like Postgres or MySQL are more heavyweight than tdb and
> lmdb. i.e. we think they'll be slower. A lot slower.

Just to follow up, tdb was custom-created along with
Samba to satify *exactly* what we needed, and no more.

