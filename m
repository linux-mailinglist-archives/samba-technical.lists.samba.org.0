Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE51729E54
	for <lists+samba-technical@lfdr.de>; Fri,  9 Jun 2023 17:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sCi+1xsSeZKlfERrk+UQNOGJJ3Jsxf9Lljqw2Y1EcaU=; b=ispUDHU3r7ooDgp+HP9mALiIVW
	tVcQLTfTiANEdWfqWDYUuNvtqe2ldsLNwhLoAb1u8nlgNcguhsiOZvMthYCKqvozDRShdPf+pbGhQ
	LZX2SLZjLZI0v725FQTf7giKZpqkGOPn9ms18OJwjMQSjtMDxPaarpkXCJ0toMGLnReI6P6WTtBru
	GQIlPVwLnlH0Zef8bi78EssLcKbKblisgrr5LafjVUsZP843BGZogNzp3sUP8BUOe0M/Hg7mnzoZx
	R+0UEryVrEd22YYZKTvqoDARGZqW1C8d4nCV0cB8wi/xuuL4MOyQ8GqO23FEq+NMG1j1XfPKTOSBD
	4AgNF/wQ==;
Received: from ip6-localhost ([::1]:38986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q7dz7-000nAy-3r; Fri, 09 Jun 2023 15:25:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q7dz0-000nAm-Tg
 for samba-technical@lists.samba.org; Fri, 09 Jun 2023 15:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=gBNDBIg+AkDwTrqnLNgV86qg7+tAt0Tdwo3Xxi0WFus=; b=b/1SzVf9sugc4hkedI3KRWIptS
 KayCeSr6KJCMRU5TzAltOQmxBPbcVYYc23s5Glfsh/F1ut7ueotMuIgYZE5g7W0LRvwyXphruRJ5q
 7Bus4ZN5dX4T9ow19KojbjgbiQrQbQ0J6AO41hgJz5CixHRRkl2gE2P6dqxS4KGB1uWu4hHHk62Kl
 4ui6mq+KfanBd0Ne/XR61K8VZ3LUixYNxYb5hcnObGnpDWg+qqDt0WlYC00g7lYvBFrXhwc+5ZxN1
 fCJtujsVrhNeA2eyhVlDw6Qbb8csvAyhfPZMFiRnl3kd6KGzbvICFPf4orS7wBIiscn5t2v1hlO9w
 7UVHtxalk6l7Clr/Vu4WP8P+350Oz6mx5YvHNgMgH20eCjF743hDa9dlHgcQk6ZxeY2iS3ewf6uB8
 hgggU+KCOEo0+ixRkfaBJLLY6+vgcp2UrDxZ+95qUs2jtNpD+3J/km3j6KeaPDKG7ljXo/t0Xh7cW
 rZhs5tkF+DAIkahEXEcA2czX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q7dz0-000oKG-0k for samba-technical@lists.samba.org;
 Fri, 09 Jun 2023 15:24:58 +0000
Message-ID: <cc374358-3e49-eba0-2f69-6902f0fc156c@samba.org>
Date: Fri, 9 Jun 2023 17:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: change rpcclient dfsgetinfo path syntax ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with samba 4.17.5 following syntax was fine (consider that all 
backslashes are escaped, so every backslash appears twice at the command 
line)

$ rpcclient localhost -U% -c 
'dfsgetinfo**\\\\localhost\\samba-share\\pointA localhost pointA'

with samba 4.18.2 only this works:

$ rpcclient localhost -U% -c 'dfsgetinfo \\localhost\samba-share\pointA 
localhost point'

Looking into /var/log/samba/log.rpcd_classic shows that:
- 4.17 is using parse_dfs_path() with trim_char(p, '/', '/')
- 4.18 is using parse_dfs_path_strict() that does not trim anything and 
assumes single '\'

/var/log/samba/log.rpcd_classic for samba-4.18.2 shows for WORKING case 
("\localhost\samba-share\pointA")

[2023/06/09 11:12:17, 10, pid=55152, effective(65534, 65534), 
real(65534, 0), class=msdfs] 
../../source3/smbd/msdfs.c:117(parse_dfs_path_strict)
   parse_dfs_path_strict: path = |\localhost\samba-share\pointA|
[2023/06/09 11:12:17, 10, pid=55152, effective(65534, 65534), 
real(65534, 0), class=msdfs] 
../../source3/smbd/msdfs.c:153(parse_dfs_path_strict)
   parse_dfs_path_strict: hostname: localhost
[2023/06/09 11:12:17, 10, pid=55152, effective(65534, 65534), 
real(65534, 0)] ../../source3/lib/util.c:998(is_myname)
   is_myname: is_myname("localhost") returns 0

and FAILING case ("\\localhost\samba-share\pointA"):


[2023/06/09 11:15:12, 10, pid=55188, effective(65534, 65534), 
real(65534, 0), class=msdfs] 
../../source3/smbd/msdfs.c:117(parse_dfs_path_strict)
   parse_dfs_path_strict: path = |\\localhost\samba-share\pointA|
[2023/06/09 11:15:12, 10, pid=55188, effective(65534, 65534), 
real(65534, 0), class=msdfs] 
../../source3/smbd/msdfs.c:153(parse_dfs_path_strict)
   parse_dfs_path_strict: hostname:
[2023/06/09 11:15:12, 10, pid=55188, effective(65534, 65534), 
real(65534, 0)] ../../source3/lib/util.c:998(is_myname)
   is_myname: is_myname("") returns 0
[2023/06/09 11:11:45,  3, pid=55152, effective(65534, 65534), 
real(65534, 0)] 
../../lib/util/util_net.c:255(interpret_string_addr_internal)
   interpret_string_addr_internal: getaddrinfo failed for name (flags 
32) [Name or service not known]



Is this change intentional? How is defined the path syntax? Do we 
support something like UNC path syntax with two leading backslashes?


Thank you,

Pavel
