Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 747145EE5C0
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 21:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uwCCTFQtnrLcqUyx1sYKrjfj6CUFpGLfGi/wt6y5D6c=; b=HY+xTMFRrE369UNrXjQYbIMWcZ
	X+fM877Mzmq+TrnLDhot5HnBlu3gh/qMcYR+K+4W8QPOMPO2jiq+bZO8k8lBS63m2JJdHE4umGZMj
	ShVF/3YO2P+LulxCwpdbynas8FtYBd9TP8Rmx9moQnHaoHkcVobHnQfjeZkrK/+aaeMv8TDNP39Ip
	o9384ZiZBpwNlm+vQXUthru6a/KwX+dBOoMep7ndbRK3J0mvCSYdB8HCzszWxLvrLnekOSXt/OhGp
	yTKyOTOIs+UUHpPf7VZiPIZQ541kFFFa75q23GReGr3eTyq2KMXnssAQCoGzMJLtrWtEa0LtVq9GS
	bUhvYfHA==;
Received: from ip6-localhost ([::1]:22882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odcnJ-004gkV-0N; Wed, 28 Sep 2022 19:32:33 +0000
Received: from hartley.uberspace.de ([185.26.156.169]:40316) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1odcnE-004gkM-BS
 for samba-technical@lists.samba.org; Wed, 28 Sep 2022 19:32:30 +0000
Received: (qmail 2193 invoked by uid 990); 28 Sep 2022 19:31:25 -0000
Authentication-Results: hartley.uberspace.de;
	auth=pass (plain)
Message-ID: <742fcb2c-69d2-235b-91c1-a188f0b9a90f@merten.dev>
Date: Wed, 28 Sep 2022 21:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: buggy krb5 ccache behavior and cmocka unit tests
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
 <c7c6a7091ea929b2937ea41c5b07d37439277571.camel@samba.org>
In-Reply-To: <c7c6a7091ea929b2937ea41c5b07d37439277571.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.896322) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.996322
Received: from unknown (HELO unkown) (::1)
 by hartley.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Wed, 28 Sep 2022 21:31:25 +0200
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
From: Christian Merten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Merten <christian@merten.dev>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/28/22 19:54, Andrew Bartlett via samba-technical wrote:
> DIR and KEYRING are implemented in MIT Kerberos, if you are running
> Samba as an AD DC then you will most likely have Samba built with our
> bundled Heimdal Kerberos.
Ah my bad. How about introducing a check that throws a descriptive error 
message if the
requested ccache type is not supported?

Christian

-- 
Christian Merten
http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xD953D69721B948B3


