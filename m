Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9526FCA36
	for <lists+samba-technical@lfdr.de>; Tue,  9 May 2023 17:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EI4sx5DzVzdB17E5Ppmpk2enocWge3zeXqatsFovxR4=; b=3IFR6gwoNadS0VJ8+8XkPCZcSE
	GRcwegALaRG4bCPoUszzBRCD6sM8JX/syo7I5NcgYY1gjNPekWeJ2AP71p21KwO/bzMrsVnmxEdcl
	UqZzOjjYWiWAuQAFWnEHyRO4oS2HijQii2vlTm25ddcgmUK5kWKJKld664kZ/SKXoC1jd5SkzQ8AZ
	reIJr1dVGlTcfy9rf8nHoM66SW/6U+lW4PVjalak7p7G/ncsZfzkeEQ7NgA6/A06Iism2JW9AgTOQ
	WWZk3eUDq6K4N/oZfvAHBZAIRR8hGwywG6zU82/JWO5+1/4YFPF91p0ejT+48Tmam1qgLxWALmRjy
	w9Z1zTPA==;
Received: from ip6-localhost ([::1]:47698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pwPFf-009AoA-6F; Tue, 09 May 2023 15:27:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13320) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pwPFa-009Ao1-UO
 for samba-technical@lists.samba.org; Tue, 09 May 2023 15:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=EI4sx5DzVzdB17E5Ppmpk2enocWge3zeXqatsFovxR4=; b=tBSlj8q2zoIG1VES7m5ev6R8YF
 7ZBWf5gmlSwO7zJTXlCJsb88ippdZxTs+1CCubnf1GxK7TTyRunh7qw7fLp70CXloI9q3xm1vZB+l
 W+oRgjhnuHiCIT5GQqqmOJhy1YyqNbXIYjOyWRwOSaiU6FHIn2YVO5/ydVVBzdlxCO9Iv9n/rOUbK
 RpnAxqWlzPe23aTRckC7FoB1o0dyj1aqUqS6epj7cfnaFvMbBKcQM6KCtRRk7SmBk9VJ3OTuvVpWt
 McNvDGExRf/wEcViAyld7554tD64k/LJLQ+60t2qMBa+O+yaBBSJbiDZHil9B5oJYxE9Dra1Nx3ic
 CorTNWmVWao+HtdCcnDLzrYvhnXyp/XPERoKJPj1lcIzpqSJPIppn7osxf2NAXRjl6xbieCo7mZzI
 uKE24FlKW4rdW3kkW+bilAYF1RVSaY8/jLDHhtyxer/8JQlPe+ROAFSorPEUfi6j7sLWG7KbC6SHm
 EuMeaC6GCHLatWdYyGEwpGxb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pwPFa-006vSh-Bw
 for samba-technical@lists.samba.org; Tue, 09 May 2023 15:27:38 +0000
To: samba-technical@lists.samba.org
Subject: Samba Team Meeting at SambaXP
Date: Tue, 09 May 2023 17:27:37 +0200
Message-ID: <1975273.tdWV9SEqCh@krikkit>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

the best would be to do the Team Meeting after the last talk tomorrow 
(Wednesday). The tracks end at 16:30.

I would suggest that we meet at 17:00 in the E-mail room for the Team meeting.

There are people already leaving on Thursday (like me). The social event 
starts at 18:30. So there should be enough time to discuss everything.


Best regards


	Andreas



