Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ADA23F1EA
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 19:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=s7WIEDVAfEH2/k6ejG8cFmarakvuWhFrqzMVtJdJCkQ=; b=g21kWBvx3aX7NyUmWI7K4iOWvI
	to6w/s44xg8JIG4kqO6H+GeyYe5rfmpvut8DF2woxG3NAdIn1HLPqp2e0MctO1dYtqBIaVnvL2C0j
	d+eJAE81AX0XCENby8F8wjI31EVltWGDQPlPjQYnlkp3Th6hTMoj9GOHCYqC+L2jhAusbJwP7p6FH
	TeGjhCMGJW2HbLc8Seke8ElLHKX9mx39GQWbpNLFLI8RYdf4cjPzjcO+F8pu7+zPWl/TdwtyApAWd
	q1FAHd5TyAPqelfseSSvO32h5xSJv7YNsaI8TrYsZgSD7WvcKo4rVI7XLSMEQrK8wRQ6VKX4210y6
	vnYy0W5w==;
Received: from localhost ([::1]:65068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k467f-00CnwU-JB; Fri, 07 Aug 2020 17:25:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k467Y-00Cnub-Dp
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 17:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=s7WIEDVAfEH2/k6ejG8cFmarakvuWhFrqzMVtJdJCkQ=; b=TKhN5CLbjRGTu+uol9eDWVkb9y
 RkikdZX2CmphmAunFzgqc4hO22BrKvwvVKMcxD7OFrFNVzawjnatgqe3IYi/elPYT9LWfJJ9s6VAX
 GMiHEyr1LIQZucg4uPYeu7SO8HxsSTIWRWUTp7NBvz/sSCG+oGjHyiLVwsF0v7i1qYStTKCI4YGph
 qmLad76Fv8a1BvpEyKvijQkeAwutlukDVFCBiZQgE6QfeyrVDPvrzWqbYso5eRMOJieWRvjqBYh1X
 XKnVHouGu17MAOZktn02M1fsHu9SzVcWTkJluvaDuRaCrGMMdmunAKG8Yp1cXdmNZ+zCGZaV7hXcr
 TzJUP+KxX71ltnrUpgNAbWvtt5pLPWp7Cn9ZNpv7S2CLgzuac64FVC4aXYeQbaFMM/Schhxy2qDKH
 rzAJd5MpFk5x15ASWoBME2CJxROxzaLwy1Zg9qP5f6l394gQ9UI6ufDOtD4Emao8w2DzOanJaBpBK
 wCGoLHWnCdbMx5J7sJL/OGK7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k467U-0006s2-A3; Fri, 07 Aug 2020 17:25:28 +0000
Date: Fri, 7 Aug 2020 10:25:22 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
Message-ID: <20200807172522.GA29361@jeremy-acer>
References: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
 <20200807163743.GE6866@jeremy-acer>
 <be19ade3-451a-7565-4a1d-b9609648c490@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be19ade3-451a-7565-4a1d-b9609648c490@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 07, 2020 at 06:52:24PM +0200, Ralph Boehme wrote:
> Am 8/7/20 um 6:37 PM schrieb Jeremy Allison:
> > OK, what it looks like is a call that can *never* fail
> > on Windows - e.g. looking up S-1-5-[LOCAL-DOMAIN-PREFIX]-513
> > must *always* map to "Domain Users" group.
> 
> but why on earth do we return "None" instead of "Domain Users"?

Well I'm guessing that there might already be a UNIX "Domain Users"
group, but someone didn't map it to RID-513.

"None" was probably considered a safer choice. Dunno though.

Ah, look here source3/passdb/passdb.c:

bool lookup_global_sam_name(const char *name, int flags, uint32_t *rid,
                            enum lsa_SidType *type)
{
        GROUP_MAP *map;
        bool ret;

        /* Windows treats "MACHINE\None" as a special name for 
           rid 513 on non-DCs.  You cannot create a user or group
           name "None" on Windows.  You will get an error that 
           the group already exists. */

        if ( strequal( name, "None" ) ) {
                *rid = DOMAIN_RID_USERS;
                *type = SID_NAME_DOM_GRP;

                return True;
        }

and here source3/groupdb/mapping.c:get_domain_group_from_sid(struct dom_sid sid, GROUP_MAP *map):

        /* special case check for rid 513 */

        if ( !ret ) {
                uint32_t rid;

                sid_peek_rid( &sid, &rid );

                if ( rid == DOMAIN_RID_USERS ) {
                        map->nt_name = talloc_strdup(map, "None");
                        if (!map->nt_name) {
                                return false;
                        }
                        map->comment = talloc_strdup(map, "Ordinary Users");
                        if (!map->comment) {
                                return false;
                        }
                        sid_copy( &map->sid, &sid );
                        map->sid_name_use = SID_NAME_DOM_GRP;
                        map->gid = (gid_t)-1;
                        return True;
                }
                return False;


