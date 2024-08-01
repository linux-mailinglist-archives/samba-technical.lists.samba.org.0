Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD59454C3
	for <lists+samba-technical@lfdr.de>; Fri,  2 Aug 2024 01:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=aXBrCB2lUNjELxtAD7Q4oU7VQgRwZ/5tJjl31w5hjas=; b=unv+QtfOglWIqfbBTejBCymTAt
	Ja5ncexbVOBabsQ74FiINrfzD8x2ZcUQf4qlKM8JWQZj+bTp5t+r2/OauOgiaOFYyrcmTaT+MTsCz
	3ZWMVBEzZjzCQJ3dQBvgL8zWe8SmqW4j58UlKhX/a+IvmDee6YrIzljWVxFswMK0P2bd8ju8VWn8r
	PYJVLWJe3Z1+ftwW4oIqf9IT7QB6X8w9AeI9C1sn0M/pfX6Bbrr1TD9LwYNwWiHTd27FGGJMIzsXa
	yDeeuc7xj3VyqNrf6qGctyJSpVoVdP/4J2A3XYWj8YPFVrdnnLz179ghxDEcXfgB6wPydirDPl5oy
	IGnskGXw==;
Received: from ip6-localhost ([::1]:27436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sZesv-003n2K-3G; Thu, 01 Aug 2024 23:07:01 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:44030) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sZesr-003n2D-Cq
 for samba-technical@lists.samba.org; Thu, 01 Aug 2024 23:06:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id 83C8E6E0D0
 for <samba-technical@lists.samba.org>; Thu,  1 Aug 2024 17:06:53 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkZFkDC8v_Hs for <samba-technical@lists.samba.org>;
 Thu,  1 Aug 2024 17:06:53 -0600 (MDT)
Received: from [10.35.115.20] (edo.et.byu.edu [10.35.115.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id 188C06E0CF
 for <samba-technical@lists.samba.org>; Thu,  1 Aug 2024 17:06:53 -0600 (MDT)
Message-ID: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
Date: Thu, 1 Aug 2024 17:06:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: become_root() Necessary for Group Quota in quotas.c?
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Orion via samba-technical <samba-technical@lists.samba.org>
Reply-To: Orion <orion@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We have a situation in which the root user does not have access to the 
files contained in a directory with SGID set. When a user navigates to 
this directory and Samba attempts to request the quota for the 
directory, it fails when the code later attempts to do a stat on the 
file because of lack of permissions.

In the file samba/source3/smbd/quotas.c if the SGID bit is set, the code 
changes the effective GID to the GID of the folder, uses become_root() 
to change to root, and then requests the quota. However, if the SGID bit 
is not set, quotas.c requests the quota without using the become_root() 
function. The question I have is, why when the SGID bit is set does it 
change to root before requesting the quota?

Can we remove the become_root() function call for this instance and 
request the quota as the GID of the folder?

I tested removing the become_root() and unbecome_root() function calls, 
and for our particular setup, it works perfectly. However, I am curious 
if there is some other setup that may have issues if this bit is removed.


