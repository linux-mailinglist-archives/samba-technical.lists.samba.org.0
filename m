Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265C2D2DB5
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 16:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KamtOIAt8DdH9wwZu69fQiBr0DdRHOnJSPLnhyW3ZDE=; b=lK3z+GSB5/gFKDzuGEtRCAI3G0
	Ra9iUjwLUxiofarR/w6HkST40AMKT91JqTDafiOjUxjP0LrDuhazzW+kgTGviHB2nI4v8SVaj1A0o
	sxZe2lqbwQb+0Q+GVjVAzgpYb7ey0+bybqIsTehJQgWH/p3HI084TK+h+UWjpaqJkrN13RcbiOym7
	e4bC8nmOazbyCGOIOLdq7FjpfujzwqdyegCGwW20ga1MCxs1HdLA+zNVioDOWEh02pa4wa7AP8ZPF
	ZOr9iyIFSVz3sB7l1NRC39TWhh112jhGn68RHOQuq+RKgaIhD0BW2stcfMgswsVvETsY2CLT+EoAx
	/+x82OSA==;
Received: from ip6-localhost ([::1]:33940 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmeU5-000Cu4-3X; Tue, 08 Dec 2020 15:00:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmeTv-000Ctt-3r
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 15:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=KamtOIAt8DdH9wwZu69fQiBr0DdRHOnJSPLnhyW3ZDE=; b=eTiMGj3JhuKRzLAv5syFyxs9NG
 uMYZWugUNrGkwgU93/TOhqPJBa0Fx4GIkrGVr79s3tlju16/m8yCtg/Ka1j2SMBobbVdUVpj8lNaQ
 3LA8M3CQo0WJe/AFPIbHa2Kq8mZQuBBW/fCPtxbhjNlT/2TKpCtgmgrgKlFQ7yXXxUXEeaiWIgNUQ
 2V7QSHFsBx2uMivF9i97POEVjpjeKw4itq0QiTLuOaRTKF1tkonkilNZkMJd+JorTFJLiY7sl/6gS
 2q6ywXJTIevlJoyGxqKeHqB/h7FYezfiHsn/2cJj8xcF673jItc/IFAmTFPYWbb1WV25xVngGnztG
 xIaP/Chy4aFm+olLHcWZUygrUrht+GskzAtMsE6qmcK/lN5QEjG5d41Gl2Mt7DGeKxwKidiePKTeo
 wPpEiE5ZnJn8TxKH0KmAVHm5jhU5gz6JXzziFoufZmpY7o4LBl8K9znmxQyoTLgwHv4Ahm32SzIDq
 uJ73BpDgUTq/0VbCFcnU3JUd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmeTX-00046H-6C; Tue, 08 Dec 2020 15:00:23 +0000
Date: Tue, 8 Dec 2020 16:00:22 +0100
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Fw: FOSDEM CfP Software Defined Storage devroom
Message-ID: <20201208160022.72fb3d69@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Jan Fajerski <jfajerski@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

FOSDEM is on again next year. Like every year, the Software Defined
Storage devroom welcomes Samba talk proposals. Please see below for
details...


Begin forwarded message:

Date: Tue, 8 Dec 2020 09:36:38 +0100
From: Jan Fajerski <jfajerski@suse.com>
To: dev@ceph.io
Subject: CfP Software Defined Storage devroom


FOSDEM is a free software event that offers open source communities a place to 
meet, share ideas and collaborate.  It is well known for being highly 
developer-oriented and in the past brought together 8000+ participants from all 
over the world.  It's home is in the city of Brussels (Belgium).

FOSDEM 2021 will take place as an online event during the weekend of February 
6./7. 2021. More details about the event can be found at http://fosdem.org/

** Call For Participation

The Software Defined Storage devroom will go into it's fifth round for talks 
around Open Source Software Defined Storage projects, management tools
and real world deployments.

Presentation topics could include but are not limited too:

- Your work on a SDS project like Ceph, Gluster, OpenEBS, CORTX or Longhorn

- Your work on or with SDS related projects like OpenStack SWIFT or Container 
   Storage Interface

- Management tools for SDS deployments

- Monitoring tools for SDS clusters

** Important dates:

- Dec 27th 2020:  submission deadline for talk proposals
- Dec 31st 2020:  announcement of the final schedule
- Feb  6th 2021:  Software Defined Storage dev room

Talk proposals will be reviewed by a steering committee:
- Niels de Vos (OpenShift Container Storage Developer - Red Hat)
- Jan Fajerski (Ceph Developer - SUSE)
- TBD

Use the FOSDEM 'pentabarf' tool to submit your proposal:
https://penta.fosdem.org/submission/FOSDEM21

- If necessary, create a Pentabarf account and activate it.
Please reuse your account from previous years if you have
already created it.
https://penta.fosdem.org/user/new_account/FOSDEM21

- In the "Person" section, provide First name, Last name
(in the "General" tab), Email (in the "Contact" tab)
and Bio ("Abstract" field in the "Description" tab).

- Submit a proposal by clicking on "Create event".

- If you plan to register your proposal in several tracks to increase your chances, 
don't! Register your talk once, in the most accurate track.

- Presentations have to be pre-recorded before the event and will be streamed on 
   the event weekend.

- Important! Select the "Software Defined Storage devroom" track
(on the "General" tab).

- Provide the title of your talk ("Event title" in the "General" tab).

- Provide a description of the subject of the talk and the
intended audience (in the "Abstract" field of the "Description" tab)

- Provide a rough outline of the talk or goals of the session (a short
list of bullet points covering topics that will be discussed) in the
"Full description" field in the "Description" tab

- Provide an expected length of your talk in the "Duration" field.
   We suggest a length between 15 and 45 minutes.

** For accepted talks

Once your proposal is accepted we will assign you a volunteer deputy who will 
help you to produce the talk recording.  The volunteer will also try to ensure 
the recording is of good quality, help with uploading it to the system, 
broadcasting it during the event and moderate the Q&A session after the 
broadcast.  Please note that as a presenter you're expected to be available 
online during and especially after the broadcast of you talk.  The schedule will 
be available under 
https://fosdem.org/2021/schedule/track/software_defined_storage/

Hope to hear from you soon! And please forward this announcement.

If you have any further questions, please write to the mailing list at
storage-devroom@lists.fosdem.org and we will try to answer as soon as
possible.

Thanks!
_______________________________________________
Dev mailing list -- dev@ceph.io
To unsubscribe send an email to dev-leave@ceph.io

