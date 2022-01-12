Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4188748CB8D
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jan 2022 20:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RJoEzruDqWMaJaLrESwL9owzA2IrfdxmuAOZ/w/3k+Y=; b=LfLJ/oPG4oGgBTG/VvlFK3+hFB
	dxaQ2QUNvgf3+Fi9bxzjS/pnPzVlS/H0BsrTAH2oM8ALmV0ajU0NHChnUuJx/4/EqV8eGD3yRTBxg
	eezVIWMz4/vAHGTH9xPcE2hpktLWIG9vnnIijm5YtfkPZlddBBOf53F+gQM4ez8XrLUrLizuPruIR
	aE+ow++IAV86S5Qftr0uSVPiGABJu1CqQGH0g1pZEwku5kuiJGbW23oZ+OjLpeti8GNKV1sDHC9b5
	6VEFvked3VetdHsEfFFEbtp+BRBjUPx/Wa2WaRtTouNebOx15g34xWZVQbVqxidEp4KlLO7VEnHB7
	1W2es66Q==;
Received: from ip6-localhost ([::1]:29014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n7j1A-007h69-DT; Wed, 12 Jan 2022 19:10:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54936) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n7j16-007h5v-35; Wed, 12 Jan 2022 19:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RJoEzruDqWMaJaLrESwL9owzA2IrfdxmuAOZ/w/3k+Y=; b=l430Br5yL6WObASho79EwlUOjy
 +AiALowFpr+eBZ436P5D0nmbG6tfgEhLz1PapbKCk+HVYBZbSJi51YcunWqWervKbnBPZ9XwR+1Un
 5xh1/i876tP8rPyoNG4KS3lJOgBCRSZw/GFJXYRZlNvlXf0BHwGiIO2R27rGrzUySYRyAAwW+xyFl
 lJjOMuL/WURWRYlGcRXCxctCgi3nGo3fdeJFjBRKiWoUZUV38rsO9TYw2FF6GbG5sUFQN6yMX6G0s
 OVQ8rA/SNK6C8Ioyed7/M3GWvtR5LPVpquznOnqnlVF5dass28q9hrb00+EoyMfyS7bbCJphZR9gy
 v2jG+C492fcM56QO9HXasWIx+jtjxDymlqF9NL9DFqr2au9AQUvKS7DeCeAb6CYuzbTYAkc/O4+8w
 6g7vZeLDMOLDwh/dpv1U9Ik2hSf+DZlbrFvsZRWQy+hsTQnTxCNN9sNKR7XGvrvaPxH396tb2sR9W
 jlxq56Gt6F6gEOTUBUwzyCsQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n7j15-006ybM-44; Wed, 12 Jan 2022 19:10:39 +0000
Date: Wed, 12 Jan 2022 11:10:36 -0800
To: John Mulligan <phlogistonjohn@asynchrono.us>
Subject: Re: [Samba] Samba in Containers/Kubernetes Status Update 2
Message-ID: <Yd8nrK4sKgYwdRRx@jeremy-acer>
References: <2815519.vuYhMxLoTh@edfu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2815519.vuYhMxLoTh@edfu>
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 12, 2022 at 01:42:12PM -0500, John Mulligan via samba wrote:
>
>Samba in Containers/Kubernetes Status Update vol. 2
>====================================================
>
>I had hoped to update the wider Samba community with another status report
>in December but I missed that boat. So January will have to do. This message
>is part of an ongoing effort to summarize what we've been up to as we
>work on integration for Samba in containers and Kubernetes [1].
>....
>ACL Xattr
>----------
>
>We still want to run our containers without privileges and therefore being
>able to store NTACLs outside of "security.NTACL" continues to be a goal. In
>order to get this functionality, Günther Deschner is continuing work on the
>open Samba project merge request [3]. Günther is working to improve the hooks
>into the VFS layer to handle performance and layering concerns raised in that
>PR.

Thanks so much for this update John. Günther, let me know if I can help
get this (store NTACLs outside of "security.NTACL") change upstream.

Looking forward to fully supported Samba in containers and Kubernetes !

