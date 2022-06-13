Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D45485FB
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jun 2022 17:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tA9nonYxoQPgdtWxeNBmYc7bMMd7eSC7bw+DNrTxegU=; b=xnDd1MSJwXJJPrPQu3eRTsSl5L
	iB4GKF7CJRZYxsHbOdeJndocH/Av+YHCEql6iHT4EJWaYDsNzje8Wvn9ua+5/YVv36VXbzVqcOxIX
	qM+HQpjAL+NLrBTpXw4lBVr4s6OqbWzLUnLkxO+6tHjDUumNS3D5uouDRiOcOBqTZJ4JmOyqVvsl9
	3GfHap/IE0UTxpp16jLeIlqdU4SJk97sp8pZQum333ovUoI/oYxMJMe1icnEr/YVDuVsOWRz13spW
	njqxqtBJhcqtaG7ByE4ppqRWXwYVFfTHzec6/UFf7ovKi+ZkgoyDmmEteeageZm9/IK1LpfkWTvQg
	v+Rw0GpA==;
Received: from ip6-localhost ([::1]:54238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o0m6H-009xET-HJ; Mon, 13 Jun 2022 15:35:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o0m6A-009xDv-7g; Mon, 13 Jun 2022 15:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=tA9nonYxoQPgdtWxeNBmYc7bMMd7eSC7bw+DNrTxegU=; b=HvnG1RGw+oOju796RfAXUEWb6O
 grYqrzwFVtoM/z9G4RVEDE3uB7R3QoF8wby7hPipsajfUNpJAHlJFrqAF+hQmeC8Dt2YC+2OqW9EU
 VEXf1HJWqItDYfOzHYZ1XhxyJX+I/iDYFp3xEXPWltvw6JgUWPWEW/5GMDEPHtzFhnVsBsOsC8JlJ
 vft5LYweqRDAkTOSU+2dPIRau/c/vObTIuPiX460WBDfoZ8G3jirN+UKO3L7ZyUUaqDbrclRJG6fe
 7kPg2tv72bqcVhKKXtm8hR6dxUajRovRSbGGhXU4pycaGJS8On37v2y8qhCLorYxj4fq9h9jhwyNH
 MPIV5gUohVmcatv21U9+ikA9ySPON2LGY72rsawgKvXjRcVmZjwLVvAWZNVbxFIrlcPup77+zXW73
 8Yqy+05GTIzCaAIFfwaZvbanBr9E2DROD1daYHgW7NWo3i0bInQ5979Rx6JN1Btj0sNlIbf9avD5Q
 Fv5OJ1NA6mxK3PLaUIVHeC4V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o0m68-005TZh-RN; Mon, 13 Jun 2022 15:35:25 +0000
Date: Mon, 13 Jun 2022 08:35:20 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: SambaXP 2022 talk videos now available on youtube !
Message-ID: <YqdZOP1RoOTRNURa@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

https://www.youtube.com/playlist?list=PLbw4szFfveGoMAryhcaaWVOjqU5eBwLoY

Thanks so much for SerNet for hosting and making these videos
available !

Jeremy.

