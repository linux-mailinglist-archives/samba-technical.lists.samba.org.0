Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61696830C7
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 13:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=csJNRy9yKfWZBqOopYymOnDMm2i12WXohWRqIZS6GrA=; b=n+HjPJnLMd/h8GR1vxZEqIam/j
	uBkbRzFR3ZryIpgppU5Y+xxg2GifnBPHcDMBU8gkDbjpZoOAaHnXSwKA1+oeOhFV0jrVadHV+iO1v
	rpibi+IDQgXgXKlq7D2hCAWFMBR8C44GShcU2CfydInQ+KeL1AFlLvJH3oCcsZpyzcvRY0pxty4OW
	ILuRgfNu1W0IfLTI9cve+nVhVzy+3QW1N9ekdPbDAQ+k6nSOWX61zWbWDaD+DUiUEdoybzK8n1/sC
	aS6sv1doJ6ZPC7oGiwZStjkKQfoJULYOQAZUvJGwfoNsBs1Zr3IlfIHj+2/lpkk58CJYou+rNf40O
	2Da/ibVg==;
Received: from localhost ([::1]:40374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1huxlW-004bXH-Vy; Tue, 06 Aug 2019 11:36:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1huxlS-004bX7-VR
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 11:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=csJNRy9yKfWZBqOopYymOnDMm2i12WXohWRqIZS6GrA=; b=i5z0VAOPSjEWB0OWshi59zfCo/
 WWI/MODfLdEdwDFYjhxlrRKpcuOnTeYmWoUAZws28tcAVCLeK8OuOTUqyNsGTHKm3pUxIGLwaGgpB
 DcbXDx16dIrgr53vYYE+Z1YwzqEfDzOsMkZFedHXhEIxwwe3+232Q2xsm9RY/L+xRme8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1huxlS-0005Q0-6L; Tue, 06 Aug 2019 11:36:26 +0000
Subject: Re: [MR] http client library improvements
To: Samuel Cabrero <scabrero@samba.org>
References: <d1245e3f-5232-f76c-b629-a8e5827b81fb@samba.org>
 <20190806112310.3gga7yzv3kjc54a3@aneto>
Message-ID: <44314444-d67f-717a-fd43-86dc274599ca@samba.org>
Date: Tue, 6 Aug 2019 13:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806112310.3gga7yzv3kjc54a3@aneto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 8/6/19 1:23 PM, Samuel Cabrero wrote:
> Hi Ralph,
> 
> thanks for notice, of course I will take a look.

thanks! :)

> Meanwhile I will assign
> the merge request to myselḟ so you can find me easily in gitlab.

Hm. Couldn't find you via the member search...

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

