Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207DF941E
	for <lists+samba-technical@lfdr.de>; Tue, 12 Nov 2019 16:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=2Qaw70yfQjznxVbLv+844Vz1DtX9aSbdIUsNPuRT7Mc=; b=XZ1j977sMgukGKvHUHCdYfZUBO
	xNVFLgU2Rgf+U3VEwxSf7HCbBL5tG+cX0qAQarJVatqn1JUB8eFOZQ1bDvppRygzVyUfYL/tqqgRW
	Wj+LYQOjSBtxuBi0+rM1GoPPva6vbV7W6Bh0Ch56e0MgVGWL8YOznpBwJdVqzbKBvplgwOlULEzDr
	5OTB2aNzvvmEtpeIX/cczbGpzIokv48XYnkz5fw8allsL+sVXec0N+Z2DmaggKyzLSln9yzvgdwpL
	LIuqDhHulkTuE0X2xqsfjB23Luza4kavy2ATRM2blXpRwWtpz7Olsb6QtCB9kGZEjOmCcTfM8m0RY
	24Nyhlqg==;
Received: from localhost ([::1]:59914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUY2j-009Gsv-MX; Tue, 12 Nov 2019 15:25:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56400) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUY2b-009Gso-N8
 for samba-technical@lists.samba.org; Tue, 12 Nov 2019 15:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=2Qaw70yfQjznxVbLv+844Vz1DtX9aSbdIUsNPuRT7Mc=; b=rCeBIHxRSF3vunIzCVAFMcYUAr
 cCyXckVXnEgedsYLna/izsrL70oki4/ieSlMHwBkUyckDooCUFChk0T4kR19RR2/mQhwxwv27UgUR
 tjvDi+H/9Ij7wNFHd7b1KKtugIFs1AuYHqB15lxd10oLiJ9q1TkGy/0brPVQioyksG16I3K7KuWbg
 0pJWmKL5EeHKxCLhyFBf9zmB0PhWGVAUlJp9dSzgKtI1+Af4mDJXQ+CR6lTKzLXm3w67xwb8VgOT7
 lo7HlFzzyDdhQrw4KAlcdpZjJtzM9q1dTsn8R52twWY6UMcLEpIbrO5+hrshGvIrh9Oz640xXYGzo
 ti7AYp2iTIqs0cO+50ObkwWYxxeTvGFghwDjcpyfGg5WGz79wV6wnJ5jHi2AHMKcshlH1pLskwy7K
 6y3WzHURmQJGnPjFLSo8jAYDsZlFOfT5z3XcOZSZP2enIMwoXH55/Zubhvgnjydu863l8WTI3q4yD
 Cw3Jl4lTlJHvO+QFQMOuf2os;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUY2a-0006dT-6o; Tue, 12 Nov 2019 15:25:12 +0000
Subject: Re: Adding @timestamp to Wireshark's INFO column for creates with
 TWrp ECP
To: Richard Sharpe <realrichardsharpe@gmail.com>
References: <CACyXjPwTFUFun5qOWYy4v+f3U-UabtUsf0RmOoQTMt8qqJ57xA@mail.gmail.com>
Message-ID: <ddb48702-769d-8fd8-1875-84bd0c6563c6@samba.org>
Date: Tue, 12 Nov 2019 16:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPwTFUFun5qOWYy4v+f3U-UabtUsf0RmOoQTMt8qqJ57xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/12/19 3:50 PM, Richard Sharpe via samba-technical wrote:
> I have recently been doing a lot of work with Windows Previous
> Versions and I was finding it hard to quickly find those create
> requests that referred to previous versions (ie, had a TWrp ECP).
> 
> So, I submitted a change to Wireshark master branch that has now been
> merged. It will likely turn up in 3.1.0.

cool, thanks!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

