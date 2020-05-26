Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7C1E1AFC
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 08:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xzDlVcrQ2W5/hoU13R1dR04gZQx022PU0RsQTbUKWJk=; b=SBl8C9kw8yI/Emp80DaZkBE3XU
	XPbqBi1HuWDp2plGuNd7OxICYIvImN0z4CzuDK3h7ZAXptDBwcXdY7nrmBhz3ENY0CirRYu04chkW
	SSUob/pHttkzr6zT2meYO41h/6CpyD2ahbZIq9ekT+cNkTLbskGFqUQmYQN79I2UljVNLxcZERErc
	3sljIcTfaxlL/KuiQIUCB/V7CnQ9AUTEnpQ8Cwj+KHgCrx4LXW+at16eAx9oTZlxf+9G2T3Lr4CYp
	Leko7VldU4PCTVnEqfM5pAcswaBd0IJUb9uSJRAQ5HBqntxVXaMm2zW7BMPW+JkxuzHlON6UWimfB
	dUXvtqgw==;
Received: from localhost ([::1]:44814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdSlO-005u5E-U2; Tue, 26 May 2020 06:08:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdSlK-005u57-0b
 for samba-technical@lists.samba.org; Tue, 26 May 2020 06:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xzDlVcrQ2W5/hoU13R1dR04gZQx022PU0RsQTbUKWJk=; b=JoNlYm9HmH/tSNbJ2sxDqHnYgH
 XEK3Vk3K5jhW56u3/qQ7hFBpQ9MBFcNlWfzac9rp+TUFqiPg4iF60ZjL0QE6/PL9Yykc6hzbTd5i0
 +OefCEqZDxOft51H/qdlzea2GvCWLnDrc0Epb1gshpaQFR2efZM4v9/808HtwY4cnPavpG2qGZxTj
 tflHy2ngdqGDui+NtJjwTnUeScDS1j5D+upcUvpzw0t9htAd79cgi0dC1aw/OV/+7ALEqgyF/BQGF
 9kgWwIMxedmeoiSTxjhXkRZy7tWMrx6Ib5M3cnL55mvVVuNkk25coYR1YWxEuqR9ngJd9nRKO4L/a
 +/5kEOT3+1JsGUbRj2M63DvxpdmM7AkFbi888tosyzy3BwS3/FzxtH432poI5OQ3IKFcwlMHOSMmW
 pxZ05FRHFzaUsHnmcqkGaVUdN4iyqj0nAx3immljMmmayLW16fsmlFrhVXlWgN9t1F0t+GwoO0ORl
 ebsDAUb6YJPU+rwp/6l/JsLb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdSlJ-0006kY-Bf; Tue, 26 May 2020 06:08:29 +0000
Subject: Re: [Announce] Samba 4.10.16 Available for Download
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <20200525091428.GA11978@carrie2> <15299219.PEbobQMlR1@magrathea>
Organization: Samba Team
Message-ID: <7144bd0a-2ece-d293-d469-946575181fb6@samba.org>
Date: Tue, 26 May 2020 08:08:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <15299219.PEbobQMlR1@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

Am 25.05.20 um 16:43 schrieb Andreas Schneider:
> On Monday, 25 May 2020 11:14:29 CEST Karolin Seeger via samba-technical wrote:
>> Release Announcements
>> ---------------------
>>
>> This is an additional bugfix release of the Samba 4.10 release series to
>> address the following issues:
> 
> Thank you very much for your work Karolin!

Thanks for your work!

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

